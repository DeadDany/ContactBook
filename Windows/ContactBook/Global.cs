using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactBook
{
    class Global
    {
        public static List<Contact> contactList = new List<Contact>();
        public static void CreateContact(string Name, string Phone)
        {
            contactList.Add(new Contact(Name, Phone));
        }
    }
}
