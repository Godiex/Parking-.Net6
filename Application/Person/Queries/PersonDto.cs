namespace Application.Person.Queries {
    public class PersonDto {
        public PersonDto()
        {            
        }

        public Guid Id { get; set; } 
        public string FirstName { get; set; } = default!;
        public string LastName { get; set; } = default!;
        public string Email { get; set; } = default!;
        public DateTime DateOfBirth { get; set; } 
    }
}