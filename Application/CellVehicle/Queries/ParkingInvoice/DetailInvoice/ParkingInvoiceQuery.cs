using System.ComponentModel.DataAnnotations;
using MediatR;

namespace Application.Person.Queries {
    public record ParkingInvoiceQuery(int cellId) : IRequest<ParkingInvoiceDto>;
    
}