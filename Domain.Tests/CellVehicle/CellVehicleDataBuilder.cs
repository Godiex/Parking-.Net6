using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Tests.InvoiceParking
{
    public class CellVehicleDataBuilder
    {
        Vehicle Vehicle = default!;
        Cell Cell = default!;
        DateTime EntryDate;
        DateTime DepartureDate;

        public Domain.Entities.CellVehicle Build()
        {
            return new Entities.CellVehicle
            {
                Vehicle = Vehicle,
                Cell = Cell,
                DepartureDate = DepartureDate,
                EntryDate = EntryDate
            };
        }

        public CellVehicleDataBuilder WithCell(Cell cell)
        {
            Cell = cell;
            return this;
        }

        public CellVehicleDataBuilder WithVehicle(Vehicle vehicle)
        {
            Vehicle = vehicle;
            return this;
        }

        public CellVehicleDataBuilder WithEntryDate(DateTime entryDate)
        {
            EntryDate = entryDate;
            return this;
        }

        public CellVehicleDataBuilder WithDepartureDate(DateTime departureDate)
        {
            DepartureDate = departureDate;
            return this;
        }

    }
}
