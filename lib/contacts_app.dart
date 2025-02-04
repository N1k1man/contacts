import 'package:contacts/screens/contacts_screen.dart';
import 'package:contacts/widgets/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:contacts/models/contact.dart';

class ContactsApp extends StatefulWidget {
  const ContactsApp({super.key});

  @override
  State<ContactsApp> createState() => _ContactsAppState();
}

class _ContactsAppState extends State<ContactsApp> {
  List<Contact> contacts = [
    Contact(
        id: 1,
        name: 'Freddie',
        surname: 'Mercury',
        phone: '+996550778888',
        email: 'nik@mail.com',
        dateOfBirth: DateTime(1946, 9, 5)),
    Contact(
        id: 2,
        name: 'Tom',
        surname: 'Hardy',
        phone: '+996555888777',
        email: 'tom@mail.com',
        dateOfBirth: DateTime.now()),
    Contact(
      id: 3,
      name: 'Nat',
      surname: 'Paggle',
      phone: '+996700200300',
      email: 'nat@mail.com',
      dateOfBirth: DateTime(2005, 5, 5),
    ),
    Contact(
      id: 3,
      name: 'Ramin',
      surname: '',
      phone: '+996505304506',
      email: 'ramin@mail.com',
      dateOfBirth: DateTime.now(),
    ),
  ];
  void addContact(Contact newContact) {
    setState(() {
      contacts.add(newContact);
    });
  }

  void openAddContactSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewContact(
        onContactCreated: addContact,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openAddContactSheet, icon: Icon(Icons.add)),
        ],
        centerTitle: true,
        title: Text(
          'Контакты',
        ),
      ),
      body: SingleChildScrollView(
        child: ContactsScreen(contacts: contacts),
      ),
    );
  }
}
