import 'package:contacts/models/contact.dart';
import 'package:contacts/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsScreen({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children:
            contacts.map((contact) => ContactCard(contact: contact)).toList(),
      ),
    );
  }
}
