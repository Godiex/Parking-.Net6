using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Parking: EntityBase<int>
    {
        public string Name { get; set; } = default!;
        public List<Cell> Cells { get; set; } = default!;

        public bool CellAvailable(string type) 
        {
            return Cells.Any(c =>  c.Type ==  type);
        }

        public Cell? GetCellAvailable(string type)
        {
            return Cells.FirstOrDefault(c => c.Busy == false && c.Type.Equals(type));
        }
    }
}
