using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Vehicle: EntityBase<int>
    {

        private enum TypesVehicle {Carro = 1, Motocicleta };
        public string Plaque { get; set; } = default!;
        public string Type { get; set; } = default!;
        public int Cylinders { get; set; }

        public Vehicle(int typeValue, string plaque, int cylinders)
        {
            Type = GetType(typeValue);
            Plaque = plaque;
            Cylinders = cylinders;
        }

        public Vehicle()
        {

        }

        public bool IsMotorcycle() => Type.Equals(GetType((int) TypesVehicle.Motocicleta));
        public string GetType(int typeValue) => Enum.GetName(typeof(TypesVehicle), typeValue);

    }
}
