using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Tests.InvoiceParking
{
    public class ParkingInvoiceDataBuilder
    {
        CellVehicle CellVehicle = default!;
        ParkingValues ParkingValues = default!;
        double Subtotal;
        double SurchangeValue;
        double TotalValue;

        public Domain.Entities.ParkingInvoice Build()
        {
            return new Entities.ParkingInvoice
            {
                CellVehicle = CellVehicle,
                ParkingValues = ParkingValues,
                Subtotal = Subtotal,
                SurchangeValue = SurchangeValue,
                TotalValue = TotalValue
            };
        }

        public ParkingInvoiceDataBuilder WithCellVehicle(CellVehicle cellVehicle)
        {
            CellVehicle = cellVehicle;
            return this;
        }

        public ParkingInvoiceDataBuilder WithParkingValues(ParkingValues parkingValues)
        {
            ParkingValues = parkingValues;
            return this;
        }

        public ParkingInvoiceDataBuilder WithSubtotalValue(double subTotalValue)
        {
            TotalValue = subTotalValue;
            return this;
        }

        public ParkingInvoiceDataBuilder WithSurchangeValue(double surchangeValue)
        {
            SurchangeValue = surchangeValue;
            return this;
        }

        public ParkingInvoiceDataBuilder WithTotalValue(double totalValue)
        {
            TotalValue = totalValue;
            return this;
        }
    }
}
