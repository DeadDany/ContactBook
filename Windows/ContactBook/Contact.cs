using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactBook
{
    class Contact
    {
        public string Name { get; set; }
        public string Phone { get; set; }

        public Contact(string Name, string Phone)
        {
            this.Name = Name;
            this.Phone = Phone;
        }
    }
}
