using Domain.Services;
using MediatR;

namespace Application.Person.Commands {

    public class PersonHandler : AsyncRequestHandler<PersonCreateCommand>
    {

        private readonly PersonService _PersonService;

        public PersonHandler(PersonService personService)
        {
            _PersonService = personService ?? throw new ArgumentNullException(nameof(personService));
        }

        protected override async Task Handle(PersonCreateCommand request, CancellationToken cancellationToken)
        {
            _ = request ?? throw new ArgumentNullException(nameof(request), "request object needed to handle this task");

            await _PersonService.RegisterPersonAsync(
                 new Domain.Entities.Person
                 {
                     Email = request.Email,
                     FirstName = request.FirstName,
                     LastName = request.LastName,
                     DateOfBirth = request.DateOfBirth.Value
                 }
             );
        }

    }
}