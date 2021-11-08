using Domain.Entities;
using Domain.Exception;
using Domain.Ports;

namespace Domain.Services
{
    [DomainService]
    public class CellVehicleService
    {
        readonly IGenericRepository<CellVehicle> _repositoryCellVehicle;
        readonly IGenericRepository<Parking> _repositoryParking;
        readonly IGenericRepository<Vehicle> _repositoryVehicle;
        readonly IGenericRepository<Cell> _repositoryCell;
        readonly IGenericRepository<ParkingValues> _repositoryParkingValues;
        readonly IGenericRepository<ParkingInvoice> _repositoryInvoiceParking;
        private List<int> ValidNumbersOddDays = new() { 1, 3, 5, 7, 9 };
        private List<int> ValidNumbersEvenDays = new() { 0, 2, 4, 6, 8 };

        public CellVehicleService(
            IGenericRepository<CellVehicle> repositoryCellVehicle,
            IGenericRepository<Parking> repositoryParking,
            IGenericRepository<Vehicle> repositoryVehicle,
            IGenericRepository<Cell> repositoryCell,
            IGenericRepository<ParkingValues> repositoryParkingValues,
            IGenericRepository<ParkingInvoice> repositoryInvoiceParking
            )
        {
            _repositoryCellVehicle = repositoryCellVehicle ?? throw new ArgumentNullException(nameof(repositoryCellVehicle), "No repo available");
            _repositoryParking = repositoryParking ?? throw new ArgumentNullException(nameof(repositoryParking), "No repo available");
            _repositoryVehicle = repositoryVehicle ?? throw new ArgumentNullException(nameof(repositoryVehicle), "No repo available");
            _repositoryCell = repositoryCell ?? throw new ArgumentNullException(nameof(repositoryCell), "No repo available");
            _repositoryParkingValues = repositoryParkingValues ?? throw new ArgumentNullException(nameof(repositoryParkingValues), "No repo available");
            _repositoryInvoiceParking = repositoryInvoiceParking ?? throw new ArgumentNullException(nameof(repositoryInvoiceParking), "No repo available");
        }

        public async Task<CellVehicle> RegisterEntranceToParkingAsync(Vehicle vehicle)
        {

            if (IsDayPickAndPlate(vehicle.Plaque))
                throw new PickAndPlateException("Today this vehicle have a restriction pick and plate");
            
            if (await ExistVehicleAsync(vehicle))
                vehicle = (await _repositoryVehicle.GetAsync(v => v.Plaque.Equals(vehicle.Plaque))).First();
            else
                await _repositoryVehicle.AddAsync(vehicle);

            CellVehicle cellVehicle = await CreateCellVehicleAsync(vehicle);
            return await _repositoryCellVehicle.AddAsync(cellVehicle);
        }

        private async Task<CellVehicle> CreateCellVehicleAsync(Vehicle vehicle)
        {
            var parking = (await _repositoryParking.GetAsync(null, null, "Cells")).ToList().First();
            if (!parking.CellAvailable(vehicle.Type))
                throw new CellNotAvailableException("Not cell avaliable");

            var cell = _repositoryCell.GetAsync(c => c.Type == vehicle.Type && c.Busy == false).Result.First();
            cell.ChangeOccupation();
            await _repositoryCell.UpdateAsync(cell);
            var cellVehicle = new CellVehicle(cell, vehicle);
            cellVehicle.SetEntryDate();
            return cellVehicle;
        }

        public async Task CheckOutAsycn(int cellId)
        {
            if(! await ExistCellVehicleAsync(cellId))
                throw new ResourceNotFoundException("the identification of the cell does not match any record of the vehicle with current parking");

            var cellVehicle = (await _repositoryCellVehicle.GetAsync(cv => cv.CellId == cellId, null, "Vehicle,Cell")).First();
            var parkingValues = (await _repositoryParkingValues.GetAsync()).First();
            cellVehicle.Cell.ChangeOccupation();
            cellVehicle.SetDepartureDate();
            cellVehicle.ChangeState();
            await _repositoryCellVehicle.UpdateAsync(cellVehicle);
            var invoiceParking = new ParkingInvoice(parkingValues, cellVehicle);
            await _repositoryInvoiceParking.AddAsync(invoiceParking);
        }

        public  bool IsDayPickAndPlate(string plate)
        {
            int lastPlateNumber = GetLastPlateNumber(plate);
            if (IsDayPair())
                return ValidNumbersEvenDays.Any(d => d.Equals(lastPlateNumber));
            else
                return ValidNumbersOddDays.Any(d => d.Equals(lastPlateNumber));
        }

        private  int GetLastPlateNumber(string plate) => Convert.ToInt32(plate.Substring(plate.Length - 1, 1));

        private  bool IsDayPair()
        {
            int currentDay = GetCurrentDay();
            return currentDay % 2 == 0;
        }

        private  int GetCurrentDay() => DateTime.Now.Day;

        public async Task<bool> ExistVehicleAsync(Vehicle vehicle)
        {
            return await _repositoryVehicle.Exist(v => v.Plaque.Equals(vehicle.Plaque));
        }

        public async Task<bool> ExistCellVehicleAsync(int cellId)
        {
            return await _repositoryCellVehicle.Exist(cv => cv.CellId == cellId && cv.State == true );
        }

    }
}
