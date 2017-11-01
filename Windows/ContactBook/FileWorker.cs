using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactBook
{
    class FileWorker
    {
        public static void ReadContacts()
        {
            Global.contactList = new List<Contact>();
            using (StreamReader reader = new StreamReader("DataBase.db"))
            {
                while (reader.Peek() > 0)
                {
                    string[] contact = reader.ReadLine().Split(':');
                    Global.contactList.Add(new Contact(contact[0], contact[1]));
                }
            }
        }

        public static void SyncContacts()
        {
            using (StreamWriter writer = new StreamWriter("DataBase.db"))
            {
                foreach (Contact contact in Global.contactList)
                {
                    writer.WriteLine("{0}:{1}", contact.Name, contact.Phone);
                }
            }
        }
    }
}
