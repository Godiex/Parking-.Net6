using System.ComponentModel.DataAnnotations;
using MediatR;

namespace Application.Person.Queries {
    public record PersonQuery([Required] Guid Id) : IRequest<PersonDto>;
    
}