using System.ComponentModel.DataAnnotations;
using MediatR;

namespace Application.Person.Queries {
    public record CellQuery() : IRequest<List<CellDto>>;
    
}