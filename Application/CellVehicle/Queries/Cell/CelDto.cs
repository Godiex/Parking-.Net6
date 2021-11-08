namespace Application.Person.Queries {

    public class CellDto
    {
        public CellDto()
        {
        }

        public int Id { get; set; }
        public int Number { get; set; }
        public bool Busy { get; set; }
        public string Type { get; set; } = default!;
    }


}