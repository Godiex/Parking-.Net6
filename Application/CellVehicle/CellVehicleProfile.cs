using Application.Person.Queries;
using AutoMapper;

namespace Application.Person
{

    public class CellVehicleProfile : Profile
    {
        public CellVehicleProfile()
        {
            CreateMap<Domain.Entities.Cell, CellDto>().ReverseMap();
            CreateMap<Domain.Entities.ParkingInvoice, ParkingInvoiceDto>()
                .ForMember(dto => dto.VehicleDto, opts => opts.MapFrom(i => new VehicleDto
                {
                    Cylinders = i.CellVehicle.Vehicle.Cylinders,
                    Plaque = i.CellVehicle.Vehicle.Plaque,
                    Type = i.CellVehicle.Vehicle.Type
                }))
                .ForMember(dto => dto.EntryDate, opts => opts.MapFrom(i => i.CellVehicle.EntryDate));
        }
    }
}