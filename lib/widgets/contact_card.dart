import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'contact_modal.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  void _showContactDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ContactModal(contact: contact);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyLargeStyle = theme.textTheme.bodyLarge!;

    bool isBirthday = contact.dateOfBirth != null &&
        contact.dateOfBirth!.year == DateTime.now().year &&
        contact.dateOfBirth!.month == DateTime.now().month &&
        contact.dateOfBirth!.day == DateTime.now().day;

    bool isEmptySurname = contact.surname.isNotEmpty;

    return GestureDetector(
      onTap: () {
        _showContactDetails(context);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      contact.name,
                      style: bodyLargeStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 10),
                    if (isEmptySurname)
                      Text(
                        contact.surname,
                        style: bodyLargeStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
              if (isBirthday) Icon(Icons.star),
            ],
          ),
        ),
      ),
    );
  }
}
