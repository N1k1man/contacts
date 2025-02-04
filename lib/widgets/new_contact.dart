import 'dart:math';
import 'package:flutter/material.dart';
import 'package:contacts/helpers/format_datetime.dart';
import 'package:contacts/models/contact.dart';

class NewContact extends StatefulWidget {
  final void Function(Contact newContact) onContactCreated;

  const NewContact({super.key, required this.onContactCreated});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  var randomId = Random().nextInt(100);
  var name = '';
  var surname = '';
  var phone = '';
  var mail = '';

  DateTime? selectedDate;

  final dateController = TextEditingController();

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    if (name != '' && selectedDate != null) {
      final dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
      );
      final newContact = Contact(
        id: randomId,
        name: name,
        surname: surname,
        phone: phone,
        email: mail,
        dateOfBirth: dateTime,
      );
      widget.onContactCreated(newContact);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, выберите дату рождения')),
      );
    }
  }

  void onDateTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDate ?? DateTime.now(),
    );
    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: onDateTap,
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    label: Text('Дата рождения'),
                    hintText: 'Выберите дату',
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: TextField(
                onChanged: (value) => setState(() => name = value),
                decoration: InputDecoration(
                  label: Text('Имя'),
                ),
              )),
              SizedBox(width: 16),
              Expanded(
                  child: TextField(
                onChanged: (value) => setState(() => surname = value),
                decoration: InputDecoration(
                  label: Text('Фамилия'),
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                onChanged: (value) => setState(() => phone = value),
                decoration: InputDecoration(
                  label: Text('Телефон'),
                ),
              )),
              SizedBox(width: 16),
              Expanded(
                  child: TextField(
                onChanged: (value) => setState(() => mail = value),
                decoration: InputDecoration(
                  label: Text('Почта'),
                ),
              )),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child:
                      TextButton(onPressed: onCanceled, child: Text('Cancel'))),
              SizedBox(width: 16),
              Expanded(
                  child:
                      ElevatedButton(onPressed: onSaved, child: Text('Save'))),
            ],
          ),
        ],
      ),
    );
  }
}
