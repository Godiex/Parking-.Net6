using System.Data;
using AutoMapper;
using Dapper;
using Domain.Ports;
using MediatR;

namespace Application.Person.Queries
{
    public class ParkingInvoiceQueryHandler : IRequestHandler<ParkingInvoiceQuery, ParkingInvoiceDto>
    {

        private readonly IDbConnection _dapperSource;
        private readonly IMapper _mapper;

        public ParkingInvoiceQueryHandler(IDbConnection dapperSource, IMapper mapper)
        {
            _dapperSource = dapperSource;
            _mapper = mapper;
        }

        public async Task<ParkingInvoiceDto> Handle(ParkingInvoiceQuery request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");
            var cellVehicle = await GetCellVehicle(request);
            var parkingValues = await GetParkingValues();
            var invoiceParking = new Domain.Entities.ParkingInvoice().CreateInvoiceParking(parkingValues, cellVehicle);
            invoiceParking.CalculateTotalValue();
            return _mapper.Map<ParkingInvoiceDto>(invoiceParking);
        }

        private async Task<Domain.Entities.CellVehicle> GetCellVehicle(ParkingInvoiceQuery request) 
        {
            var cellVehicle = await _dapperSource.QuerySingleAsync<Domain.Entities.CellVehicle>(
                "select * from block.CellVehicle cv where cv.CellId = @id and cv.State = 1",
                new { Id = request.cellId }
                );

            var vehicle = await _dapperSource.QuerySingleAsync<Domain.Entities.Vehicle>(
                "select * from block.Vehicle v where v.Id = @id",
                new { Id = cellVehicle.VehicleId }
                );

            cellVehicle.Vehicle = vehicle;
            cellVehicle.SetDepartureDate();

            return cellVehicle;
        }

        private async Task<Domain.Entities.ParkingValues> GetParkingValues()
        {
            return await _dapperSource.QuerySingleAsync<Domain.Entities.ParkingValues>(
                "select * from block.ParkingValues"
                );
        }

    }
}