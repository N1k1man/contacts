import 'package:contacts/models/contact.dart';
import 'package:contacts/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts;
  final Function(Contact) onContactDeleted;

  const ContactsScreen(
      {super.key, required this.contacts, required this.onContactDeleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: contacts.map((contact) {
          return Dismissible(
            key: ValueKey(contact.id),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              onContactDeleted(contact);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Контакт ${contact.name} удален')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            child: ContactCard(contact: contact),
          );
        }).toList(),
      ),
    );
  }
}
