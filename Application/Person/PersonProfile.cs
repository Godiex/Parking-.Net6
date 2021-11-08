using Application.Person.Queries;
using AutoMapper;

namespace Application.Person
{

    public class PersonProfile : Profile
    {
        public PersonProfile()
        {
            CreateMap<Domain.Entities.Person, PersonDto>().ReverseMap();
        }
    }
}