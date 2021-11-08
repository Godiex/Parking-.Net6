using Domain.Services;
using MediatR;

namespace Application.Person.Commands {

    public class CellVehicleCreateHandler : AsyncRequestHandler<CellVehicleCreateCommand>
    {

        private readonly CellVehicleService _CellVehicleService;

        public CellVehicleCreateHandler(CellVehicleService cellVehicleService)
        {
            _CellVehicleService = cellVehicleService ?? throw new ArgumentNullException(nameof(cellVehicleService));
        }

        protected override async Task Handle(CellVehicleCreateCommand request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");

            await _CellVehicleService.RegisterEntranceToParkingAsync(
                 new Domain.Entities.Vehicle(request.Type, request.Plaque, request.Cylinders)
             );
        }

    }
}