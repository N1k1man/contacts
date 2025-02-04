import 'package:contacts/helpers/format_datetime.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactModal extends StatelessWidget {
  final Contact contact;

  const ContactModal({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Имя: ${contact.name}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Фамилия: ${contact.surname}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Телефон: ${contact.phone}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Почта: ${contact.email}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Дата рождения: ${formatDate(contact.dateOfBirth)}',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
