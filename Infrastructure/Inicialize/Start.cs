using System.Linq;
using Infraestructura;
using Infraestructura.Inicializacion;
using Infrastructure.Context;

namespace ICBF.MICAV.Infrastructure.Initialize
{
    public class Start
    {
        private readonly PersistenceContext _context;
        public Start(PersistenceContext context)
        {
            _context = context;
        }

        public void Inicializar()
        {
            if (!_context.Parking.Any()) ParkingInitialize.Inicializar(_context);
            if (!_context.ParkingValues.Any()) ParkingValuesInitialize.Inicializar(_context);
        }
    }
}