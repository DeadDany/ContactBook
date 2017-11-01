using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ContactBook
{
    /// <summary>
    /// Логика взаимодействия для EditContactWindow.xaml
    /// </summary>
    public partial class EditContactWindow : Window
    {
        public string Name = null;
        public string Phone = null;

        public EditContactWindow(int index)
        {
            InitializeComponent();

            nameTextBox.Text = Global.contactList[index].Name;
            phoneTextBox.Text = Global.contactList[index].Phone;
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            if (nameTextBox.Text.Length > 0 && phoneTextBox.Text.Length > 0)
            {
                Name = nameTextBox.Text;
                Phone = phoneTextBox.Text;

                this.Close();
            }
        }

        private void cancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
