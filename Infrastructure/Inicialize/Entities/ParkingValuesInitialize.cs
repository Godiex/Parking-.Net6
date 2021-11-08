using System.Collections.Generic;
using ICBF.MICAV.Infrastructure;
using Infrastructure.Context;

namespace Infraestructura.Inicializacion
{
    public static class ParkingValuesInitialize
    {
        public static void Inicializar(PersistenceContext persistenceContext)
        {
            var parkingValues = new Domain.Entities.ParkingValues
            {
                MotorcycleHourValue = 500,
                DayMotorcycleValue = 4000,
                CarHourValue = 1000,
                CarDayValue = 8000,
                ValueSurchange = 2000
            };
            
            persistenceContext.ParkingValues.Add(parkingValues);
            persistenceContext.SaveChanges();
        }
    }
}