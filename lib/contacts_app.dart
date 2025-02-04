import 'package:contacts/screens/contacts_screen.dart';
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
        name: 'Nigga',
        surname: 'Rogga',
        phone: '+996550778838',
        email: 'nik@mail.com',
        dateOfBirth: DateTime(1991, 9, 17)),
    Contact(
        id: 2,
        name: 'Tom',
        surname: 'Hardy',
        phone: '+996555888777',
        email: 'tom@mail.com',
        dateOfBirth: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Контакты',
        ),
      ),
      body: ContactsScreen(contacts: contacts),
    );
  }
}
