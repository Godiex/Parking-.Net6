namespace Application.Person.Queries {
    public class ParkingInvoiceMadeDto
    {
        public double SurchangeValue { get; set; }
        public double Subtotal { get; set; }
        public double TotalValue { get; set; }
        public string Plaque { get; set; } = default!;
        public int Cylinders { get; set; }
        public int NumberCell { get; set; }
        public string Type { get; set; } = default!;
    }

    

}