using Application.Person.Commands;
using Application.Person.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers;


[ApiController]
[Route("api/[controller]")]
public class CellVehicleController
{

    readonly IMediator _mediator = default!;

    public CellVehicleController(IMediator mediator) => _mediator = mediator;

    [HttpPost]
    public async Task Post(CellVehicleCreateCommand request) => await _mediator.Send(request);

    [HttpPatch("{id}")]
    public async Task Update(int id) => await _mediator.Send(new CellVehicleUpdateCommand(id));

    [HttpGet]
    public async Task<List<CellDto>> Get() => await _mediator.Send(new CellQuery());

    [HttpGet("PakingDetail{id}")]
    public async Task<ParkingInvoiceDto> GetParkingDetail(int id) => await _mediator.Send(new ParkingInvoiceQuery(id));
    [HttpGet("ParkingInvoiceMade")]
    public async Task<List<ParkingInvoiceMadeDto>> GetParkingInvoiceMade() => await _mediator.Send(new ParkingInvoiceMadeQuery());

}
