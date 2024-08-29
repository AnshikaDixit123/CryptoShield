
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/pages/Core%20App/Generator/algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Generator extends StatefulWidget {
  const Generator({super.key});

  @override
  State<Generator> createState() => _GeneratorState();
}

  final TextEditingController hintController = TextEditingController();
  final TextEditingController randomTextController = TextEditingController();
  String generatedPassword = '';

class _GeneratorState extends State<Generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: tCardBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          elevation: 5.0, // More prominent elevation
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Generate a Secure Password',
                  style: TextStyle(
                    fontSize: 24.0, // Slightly larger title
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor, // Teal color for consistency
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password Hint',
                    labelStyle: TextStyle(color: Colors.grey[700]), // Gray label
                  ),
                  controller: hintController,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Random Text',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                  controller: randomTextController,
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        String hint = hintController.text;
                        String randomText = randomTextController.text;
                        generatedPassword = generatePassword(hint, randomText);
                        _showPasswordDialog(context); // Call dialog function
                      });
                    },
                    style: ElevatedButton.styleFrom(                      
                      foregroundColor: tCardBgColor, 
                      backgroundColor: tPrimaryColor, // White text on button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded button corners
                      ),
                    ),
                    child: const Text('Generate Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Generated Password'),
          content: SelectableText(
            generatedPassword,
            style: const TextStyle(fontSize: 16.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: generatedPassword));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password copied to clipboard!',selectionColor: tCardBgColor,),
                    backgroundColor: tAccentColor,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Copy'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

