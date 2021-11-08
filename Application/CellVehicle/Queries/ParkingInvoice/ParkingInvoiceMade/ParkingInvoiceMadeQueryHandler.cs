using System.Data;
using AutoMapper;
using Dapper;
using Domain.Ports;
using MediatR;

namespace Application.Person.Queries
{
    public class ParkingInvoiceMadeQueryHandler : IRequestHandler<ParkingInvoiceMadeQuery, List<ParkingInvoiceMadeDto>>
    {

        private readonly IDbConnection _dapperSource;
        private readonly IMapper _mapper;

        public ParkingInvoiceMadeQueryHandler(IDbConnection dapperSource, IMapper mapper)
        {
            _dapperSource = dapperSource;
            _mapper = mapper;
        }

        public async Task<List<ParkingInvoiceMadeDto>> Handle(ParkingInvoiceMadeQuery request, CancellationToken cancellationToken)
        {
            return (await _dapperSource.QueryAsync<ParkingInvoiceMadeDto>(
                String.Concat(
                "select i.Subtotal, i.TotalValue, i.SurchangeValue,v.Plaque, v.Cylinders, v.Type, c.Number as NumberCell",
                " from block.InvoiceParking i ",
                "inner join block.CellVehicle cv ",
                "on(cv.Id = i.CellVehicleId) ",
                "inner join block.Cell c ",
                "on(c.Id = cv.CellId) ",
                "inner join block.Vehicle v ",
                "on(v.Id = cv.VehicleId) ",
                "where cv.State = 0 "
                ))).ToList();
        }

        public void prueba() 
        {
            string a = String.Concat("safsf", "sadf");
        }

    }
}