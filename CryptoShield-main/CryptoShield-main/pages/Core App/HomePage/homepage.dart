
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/pages/Core%20App/models/db_services.dart';
import 'package:flutter/material.dart';
import 'password_list.dart'; // For clipboard functionality


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const PasswordList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: tAccentColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddPasswordDialog(),
          );
        },
        child: const Icon(Icons.add,color: tWhiteColor,),
      ),
    );
  }
}

class AddPasswordDialog extends StatefulWidget {
  const AddPasswordDialog({super.key});

  @override
  _AddPasswordDialogState createState() => _AddPasswordDialogState();
}

class _AddPasswordDialogState extends State<AddPasswordDialog> {
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add Password')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(labelText: 'UserName'),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Email'),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            obscureText: true, // Hide password text
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final website = _websiteController.text;
            final username = _usernameController.text;
            final password = _passwordController.text;

            if (website.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
              PasswordManager().addPassword(website, username, password);
              Navigator.pop(context);
            } else {
              // Show a message or handle validation
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
