using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class ParkingInvoice: EntityBase<int>
    {
        const int CYLINDERS_MAXIMUN_MOTORCYCLE = 500;
        public double SurchangeValue { get; set; }
        public double Subtotal { get; set;}
        public double TotalValue { get; set; }
        [ForeignKey("CellVehicleId")]
        public int CellVehicleId { get; set; }
        public CellVehicle? CellVehicle { get; set; } = default!;
        [ForeignKey("ParkingValuesId")]
        public int ParkingValuesId { get; set; }
        public ParkingValues? ParkingValues { get; set; } = default!;

        public ParkingInvoice(ParkingValues parkingValues, CellVehicle cellVehicle)
        {
            CellVehicleId = cellVehicle.Id;
            ParkingValuesId = parkingValues.Id;
            CellVehicle = cellVehicle;
            ParkingValues = parkingValues;
            CalculateTotalValue();
            CellVehicle = null;
            ParkingValues = null;
        }

        public ParkingInvoice()
        {

        }

        public ParkingInvoice CreateInvoiceParking(ParkingValues parkingValues, CellVehicle cellVehicle)
        {
            CellVehicle = cellVehicle;
            ParkingValues = parkingValues;
            return this;
        }

        public void CalculateTotalValue()
        {
            if (CellVehicle.Vehicle.IsMotorcycle())
                CalculateTotalMotorcycleValue();
            else
                CalculateTotalValueCar();
        }
        public void CalculateTotalMotorcycleValue()
        {
            int numberHours = CellVehicle.GetHoursBetwenDates();
            int numberDays = CellVehicle.GetDaysBetwenDates();
            if (IsChargePerHour())
                Subtotal =  ParkingValues.MotorcycleHourValue * numberHours;
            if (numberDays == 0 && numberHours >= 9)
            {
                Subtotal = ParkingValues.DayMotorcycleValue;
                SurchangeValue = ParkingValues.ValueSurchange;
            }
            else 
            {
                if (numberHours >= 9)
                {
                    Subtotal = numberDays * ParkingValues.DayMotorcycleValue;
                }
                else 
                {
                    Subtotal = numberDays * ParkingValues.DayMotorcycleValue + numberHours * ParkingValues.MotorcycleHourValue;
                }
                if(HasSuerchange())
                    SurchangeValue = numberDays * ParkingValues.ValueSurchange;
            }
            TotalValue = Subtotal + SurchangeValue;
        }

        public void CalculateTotalValueCar()
        {
            int numberHours = CellVehicle.GetHoursBetwenDates();
            int numberDays = CellVehicle.GetDaysBetwenDates();
            if (IsChargePerHour())
                TotalValue = ParkingValues.CarHourValue * numberHours;
            if (numberDays == 0 && numberHours >= 9)
                Subtotal = ParkingValues.CarDayValue;
            else
            {
                if (numberHours >= 9)
                {
                    numberDays += 1;
                    Subtotal = numberDays * ParkingValues.CarDayValue;
                }
                else 
                    Subtotal = numberDays * ParkingValues.CarDayValue + numberHours * ParkingValues.CarHourValue;
            }
            TotalValue = Subtotal;
        }

        private bool IsChargePerHour() 
        { 
            return CellVehicle.GetHoursBetwenDates() < 9 && CellVehicle.GetDaysBetwenDates() == 0;
        } 

        public bool HasSuerchange()
        {
            if (CellVehicle.Vehicle.IsMotorcycle())
                return CellVehicle.Vehicle.Cylinders > CYLINDERS_MAXIMUN_MOTORCYCLE;
            else
                return false;
        }

    }
}
