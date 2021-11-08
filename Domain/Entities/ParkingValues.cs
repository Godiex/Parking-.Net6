using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class ParkingValues: EntityBase<int>
    {
        public double MotorcycleHourValue { get; set; }
        public double DayMotorcycleValue { get;set; }
        public double CarHourValue { get; set; }
        public double CarDayValue { get; set; }
        public double ValueSurchange { get; set; }
    }
}
