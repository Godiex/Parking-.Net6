using Application.Ports;
using Domain.Services;
using MediatR;

namespace Application.Person.Commands {

    public class PersonUpdateAsyncHandler : AsyncRequestHandler<PersonUpdateAsyncCommand>
    {

        private readonly IMessaging _messaging;

        public PersonUpdateAsyncHandler(IMessaging messaging)
        {
            _messaging = messaging;
        }

        protected override async Task Handle(PersonUpdateAsyncCommand request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");
            await _messaging.SendMessageAsync(request, "some-queue");
        }

    }
}