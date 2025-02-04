import 'package:contacts/helpers/format_datetime.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactModal extends StatelessWidget {
  final Contact contact;

  const ContactModal({super.key, required this.contact});

  String _getFieldValue(String? value) {
    return value?.isNotEmpty == true ? value! : 'Не указана';
  }

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
            'id: ${contact.id}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Имя: ${_getFieldValue(contact.name)}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Фамилия: ${_getFieldValue(contact.surname)}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Телефон: ${_getFieldValue(contact.phone)}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Почта: ${_getFieldValue(contact.email)}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8),
          Text(
            'Дата рождения: ${contact.dateOfBirth != null ? formatDate(contact.dateOfBirth!) : 'Не указана'}',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
