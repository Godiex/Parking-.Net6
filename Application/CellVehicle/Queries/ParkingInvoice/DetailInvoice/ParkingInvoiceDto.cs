namespace Application.Person.Queries {
    public class ParkingInvoiceDto
    {
        public double SurchangeValue { get; set; }
        public double Subtotal { get; set; }
        public double TotalValue { get; set; }
        public DateTime EntryDate { get; set; }
        public VehicleDto VehicleDto { get; set; } = default!;
    }

    public class VehicleDto
    {
        public string Plaque { get; set; } = default!;
        public string Type { get; set; } = default!;
        public int Cylinders { get; set; }
    }

}