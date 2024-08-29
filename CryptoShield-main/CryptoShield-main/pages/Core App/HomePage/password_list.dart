import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/pages/Core%20App/models/db_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordList extends StatefulWidget {
  const PasswordList({super.key});

  @override
  _PasswordListState createState() => _PasswordListState();
}

class _PasswordListState extends State<PasswordList> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: PasswordManager().getPasswords(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final passwords = snapshot.data!.docs;

                // Filter passwords based on search query
                final filteredPasswords = passwords.where((password) {
                  final username = password.data()['website'].toLowerCase();
                  return username.contains(_searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: filteredPasswords.length,
                  itemBuilder: (context, index) {
                    final passwordData = filteredPasswords[index].data();
                    final website = passwordData['website'];
                    final username = passwordData['username'];
                    final documentId = filteredPasswords[index].id;
                    final password = passwordData['password'];

                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Card(
                        color: tCardBgColor,
                        elevation: 3,
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text(
                            website,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 86, 84, 84),
                            ),
                          ),
                          subtitle: Text(username),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: password));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password copied to clipboard')));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirm Deletion'),
                                      content: const Text('Are you sure you want to delete this password?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            PasswordManager().deletePassword(documentId);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.update),
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => UpdatePasswordDialog(
                                    initialWebsite: passwordData['website'],
                                    initialUsername: passwordData['username'],
                                    initialPassword: passwordData['password'],
                                    documentId: documentId,
                                    passwordData: passwordData,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class UpdatePasswordDialog extends StatefulWidget {
  final String initialWebsite;
  final String initialUsername;
  final String initialPassword;
  final String documentId;
  final Map<String, dynamic> passwordData;

  UpdatePasswordDialog({
    required this.initialWebsite,
    required this.initialUsername,
    required this.initialPassword,
    required this.documentId,
    required this.passwordData,
  });

  @override
  _UpdatePasswordDialogState createState() => _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends State<UpdatePasswordDialog> {
  late TextEditingController _websiteController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _websiteController = TextEditingController(text: widget.initialWebsite);
    _usernameController = TextEditingController(text: widget.initialUsername);
    _passwordController = TextEditingController(text: widget.initialPassword);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(labelText: 'Website'),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(
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
              PasswordManager().updatePassword(widget.documentId, website, username, password);
              Navigator.pop(context);
            } else {
              // Show a message or handle validation
            }
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
