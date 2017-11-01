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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ContactBook
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            deleteButton.IsEnabled = false;
            editButton.IsEnabled = false;
            deleteMenuItem.IsEnabled = false;
            editMenuItem.IsEnabled = false;

            FileWorker.ReadContacts();

            foreach (Contact contact in Global.contactList)
            {
                contactListBox.Items.Add(contact.Name);
            }
        }

        private void contactListBox_ReloadData()
        {
            contactListBox.Items.Clear();

            foreach (Contact contact in Global.contactList)
            {
                contactListBox.Items.Add(contact.Name);
            }
        }

        private void contactListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (contactListBox.SelectedIndex != -1)
            {
                nameLabel.Content = Global.contactList[contactListBox.SelectedIndex].Name;
                phoneLabel.Content = Global.contactList[contactListBox.SelectedIndex].Phone;
                deleteButton.IsEnabled = true;
                editButton.IsEnabled = true;
                deleteMenuItem.IsEnabled = true;
                editMenuItem.IsEnabled = true;
            }
            else
            {
                deleteButton.IsEnabled = false;
                editButton.IsEnabled = false;
                deleteMenuItem.IsEnabled = false;
                editMenuItem.IsEnabled = false;
            }
        }

        private void loadButton_Click(object sender, RoutedEventArgs e)
        {
            FileWorker.ReadContacts();
            contactListBox_ReloadData();
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            FileWorker.SyncContacts();
        }

        private void createButton_Click(object sender, RoutedEventArgs e)
        {
            CreateContactWindow window = new CreateContactWindow();
            window.ShowDialog();

            if (window.Name != null && window.Phone != null)
            {
                Global.contactList.Add(new Contact(window.Name, window.Phone));
                contactListBox_ReloadData();
            }
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            Global.contactList.RemoveAt(contactListBox.SelectedIndex);
            contactListBox.Items.RemoveAt(contactListBox.SelectedIndex);
        }

        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            EditContactWindow window = new EditContactWindow(contactListBox.SelectedIndex);
            window.ShowDialog();

            if (window.Name != null && window.Phone != null)
            {
                Global.contactList[contactListBox.SelectedIndex].Name = window.Name;
                Global.contactList[contactListBox.SelectedIndex].Phone = window.Phone;
                contactListBox_ReloadData();
            }
        }

        private void aboutMenuItem_Click(object sender, RoutedEventArgs e)
        {
            AboutWindow window = new AboutWindow();
            window.Show();
        }
    }
}
