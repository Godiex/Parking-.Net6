using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class CellVehicle : EntityBase<int>
    {
        [ForeignKey("CellId")]
        public int CellId { get; set; }
        public Cell? Cell { get; set; }
        [ForeignKey("VehicleId")]
        public int VehicleId { get; set; }
        public Vehicle? Vehicle { get; set; } 
        public DateTime EntryDate { get; set; }
        public DateTime DepartureDate { get; set; }
        public bool State { get; set; } = true;

        public CellVehicle(Cell cell, Vehicle vehicle)
        {
            CellId = cell.Id;
            VehicleId = vehicle.Id;
        }

        public CellVehicle()
        {

        }

        public int GetDaysBetwenDates() 
        {
            var vehicleTimeInParking = GetParkingTime();
            return vehicleTimeInParking.Days;
        }

        public int GetHoursBetwenDates()
        {
            var vehicleTimeInParking = GetParkingTime();
            return vehicleTimeInParking.Hours;
        }

        private TimeSpan GetParkingTime() => DepartureDate - EntryDate;
          
        public void SetEntryDate() 
        { 
            EntryDate = DateTime.Now;
        }

        public void SetDepartureDate()
        {
            DepartureDate = DateTime.Now;
        }

        public void ChangeState()
        {
            State = !State;
        }

    }
}
