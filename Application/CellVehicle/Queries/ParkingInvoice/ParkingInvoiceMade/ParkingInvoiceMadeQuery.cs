using System.ComponentModel.DataAnnotations;
using MediatR;

namespace Application.Person.Queries {
    public record ParkingInvoiceMadeQuery() : IRequest<List<ParkingInvoiceMadeDto>>;
    
}