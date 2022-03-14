import 'package:flutter/material.dart';
import 'package:plesson/data/models/assistant.dart';
import 'package:plesson/routes.dart' as routes;
import 'package:plesson/ui/components/nav_bar.dart';
import 'package:plesson/ui/components/text_input_dialog.dart';

import '../../data/repositories/subjects_repository.dart';
import '../components/subject_chips.dart';

class EditProfileScreen extends StatelessWidget {
  final Assistant user;

  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(pageName: 'Edit Profile', showAvatar: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _ListEditTile(
              title: 'Title',
              description: 'Change your displayed title',
              valueChanged: (String title) {
                user.title = title;
              },
            ),
            _ListEditTile(
              title: 'Description',
              description: 'Change your displayed description card',
              valueChanged: (String description) {
                user.description = description;
              },
            ),
            _ListEditTile(
              title: 'E-mail',
              description: 'Change your displayed e-mail address',
              valueChanged: (String email) {
                user.email = email;
              },
            ),
            _ListEditTile(
              title: 'LinkedIn',
              description: 'Change your displayed LinkedIn profile',
              valueChanged: (String linkedIn) {
                user.linkedIn = linkedIn;
              },
            ),
            _ListEditTile(
              title: 'Facebook',
              description: 'Change your displayed FaceBook profile',
              valueChanged: (String facebook) {
                user.facebook = facebook;
              },
            ),

            Autocomplete<String>(
              initialValue: const TextEditingValue(text: "Add a Subject"),
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                var subjects = SubjectsRepository();
                return subjects.getAllSubjects().where((String option) {
                  return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                user.addSubject(selection);
              },
            ),
            SizedBox(height: 40),
            Subjects(
              subjects: user.subjects,
              removeButton: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListEditTile extends StatelessWidget {
  final String title;
  final String description;
  final Function(String) valueChanged;

  const _ListEditTile({
    Key? key,
    required this.title,
    required this.description,
    required this.valueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ),
      onTap: () => _openInputDialog(context),
    );
  }

  void _openInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TextInputDialog(
          text: 'Change $title',
          onResult: (String? value) {
            if (value != null) valueChanged(value);
          },
        );
      },
    );
  }
}
