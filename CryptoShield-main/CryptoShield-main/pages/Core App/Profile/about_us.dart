import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us", style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Team Members Section
            const Text(
              'Team Members:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Anshika Dixit',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '2001220130017',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ahsan Ahmad Siddiqui',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '2001220130009',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),

            // Project Overview Section
            const SizedBox(height: 20.0),
            const Text(
              'Project Overview:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'CryptoShield is a password generator and manager designed to enhance the security of your digital assets.',
              style: TextStyle(fontSize: 16.0),
            ),

            // Project Objectives Section
            const SizedBox(height: 20.0),
            const Text(
              'Project Objectives:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              // Set a reasonable maximum height to avoid excessive scrolling
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: 3, // Number of objectives
              itemBuilder: (context, index) {
                final objectiveText = [
                  '• Enhance the security of digital assets by providing a secure platform for storing and managing passwords.',
                  '• Create an intuitive and easy-to-use interface for users of all technical backgrounds.',
                  '• Promote strong password practices by incorporating a password recommendation engine.',
                ][index];
                return Text(
                  objectiveText,
                  style: const TextStyle(fontSize: 16.0),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
