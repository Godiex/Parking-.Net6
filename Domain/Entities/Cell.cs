using Domain.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Cell: EntityBase<int>
    {
        public int Number { get; set; }
        public bool Busy { get; set; }
        public string Type { get; set; } = default!;

        public void ChangeOccupation()
        {
            Busy = !Busy;
        }
    }
}
