using Domain.Exception;
using Domain.Ports;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NSubstitute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Tests.InvoiceParking
{
    [TestClass]
    public class CellVehicleServiceTest
    {
        Services.CellVehicleService cellVehicleService = default!;
        IGenericRepository<Domain.Entities.CellVehicle> _cellVehicleRepository = default!;
        IGenericRepository<Domain.Entities.Vehicle> _vehicleRepository = default!;
        IGenericRepository<Domain.Entities.Parking> _parkingRepository = default!;
        IGenericRepository<Domain.Entities.Cell> _cellRepository = default!;
        IGenericRepository<Domain.Entities.ParkingValues> _parkingValuesRepository = default!;
        IGenericRepository<Domain.Entities.ParkingInvoice> _parkingInvoiceRepository = default!;
        private enum TypesVehicle { Carro = 1, Motocicleta };

        [TestInitialize]
        public void Init() 
        {
            _cellVehicleRepository = Substitute.For<IGenericRepository<Domain.Entities.CellVehicle>>();
            _vehicleRepository = Substitute.For<IGenericRepository<Domain.Entities.Vehicle>>();
            _parkingRepository = Substitute.For<IGenericRepository<Domain.Entities.Parking>>();
            _cellRepository = Substitute.For<IGenericRepository<Domain.Entities.Cell>>();
            _parkingValuesRepository = Substitute.For<IGenericRepository<Domain.Entities.ParkingValues>>();
            _parkingInvoiceRepository = Substitute.For<IGenericRepository<Domain.Entities.ParkingInvoice>>();
            cellVehicleService = new Services.CellVehicleService
            (
                _cellVehicleRepository,
                _parkingRepository, 
                _vehicleRepository, 
                _cellRepository, 
                _parkingValuesRepository, 
                _parkingInvoiceRepository
            );
        }

        [TestMethod]
        public async Task FailedToRegisterEntranceVehicleWithPickAndPlate()
        {
            try
            {
                string plaque = IsDayPair() ? "ASD654" : "ASD123";
                var vehicle = new Entities.Vehicle((int)TypesVehicle.Motocicleta, plaque, 130);
                await cellVehicleService.RegisterEntranceToParkingAsync(vehicle);
            }
            catch (System.Exception ex)
            {
                Assert.IsTrue(ex is PickAndPlateException);
            }
        }

        private bool IsDayPair()
        {
            int currentDay = DateTime.Now.Day;
            return currentDay % 2 == 0;
        }

        

    }
}
