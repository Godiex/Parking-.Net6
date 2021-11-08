using System.ComponentModel.DataAnnotations;
using MediatR;

namespace Application.Person.Queries {
    public record CellVehicleUpdateCommand([Required] int Id) : IRequest;
    
}