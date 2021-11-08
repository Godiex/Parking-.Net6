using Application.Person.Queries;
using Domain.Services;
using MediatR;

namespace Application.Person.Commands {

    public class CellVehicleUpdateHandler : AsyncRequestHandler<CellVehicleUpdateCommand>
    {

        private readonly CellVehicleService _CellVehicleService;

        public CellVehicleUpdateHandler(CellVehicleService cellVehicleService)
        {
            _CellVehicleService = cellVehicleService ?? throw new ArgumentNullException(nameof(cellVehicleService));
        }

        protected override async Task Handle(CellVehicleUpdateCommand request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");

            await _CellVehicleService.CheckOutAsycn(request.Id);
        }

    }
}