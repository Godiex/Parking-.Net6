using System;
using Domain.Entities;

namespace Domain.Tests.Person
{
    public class PersonDataBuilder
    {
        string FirstName = default!;
        string LastName = default!;
        string Email = default!;
        DateTime DateOfBirth;

        public Domain.Entities.Person Build()
        {
            Domain.Entities.Person person = new(FirstName, LastName, Email, DateOfBirth);           
            return person;
        }

        public PersonDataBuilder WithDateOfBirth(DateTime dateOfBirth)
        {
            DateOfBirth = dateOfBirth;
            return this;
        } 

        public PersonDataBuilder WithName(string name)
        {
            FirstName = name;
            return this;
        }

        public PersonDataBuilder WithLastName(string last)
        {
            LastName = last;
            return this;
        }

        public PersonDataBuilder WithEmail(string email)
        {
            Email = email;
            return this;
        }
    }
}
