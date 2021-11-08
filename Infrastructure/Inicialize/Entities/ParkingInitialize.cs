using System.Collections.Generic;
using ICBF.MICAV.Infrastructure;
using Infrastructure.Context;

namespace Infraestructura.Inicializacion
{
    public static class ParkingInitialize
    {
        public static void Inicializar(PersistenceContext persistenceContext)
        {
            var cells = new List<Domain.Entities.Cell>();

            for (int i = 0; i < 20; i++) 
            {
                cells.Add(new Domain.Entities.Cell { 
                    Busy = false,
                    Number = i,
                    Type = "Carro"
                });
            }

            for (int i = 0; i < 10; i++)
            {
                cells.Add(new Domain.Entities.Cell
                {
                    Busy = false,
                    Number = i,
                    Type = "Motocicleta"
                });
            }

            var parking = new Domain.Entities.Parking
            {
                Cells = cells,
                Name = "Parqueadero Ceiba Adn"
            };
            
            persistenceContext.Parking.Add(parking);
            persistenceContext.SaveChanges();
        }
    }
}