import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionScreen extends StatelessWidget {
  const VersionScreen({super.key});

  Future<String> _getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } on PlatformException catch (error) {
      // Handle PlatformException if version retrieval fails
      return 'Error: ${error.message}';
    } catch (error) {
      // Handle other potential errors
      return 'Error: An unexpected error occurred.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version',style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CryptoShield',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            FutureBuilder<String>(
              future: _getAppVersion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Version: ${snapshot.data}',
                    style: const TextStyle(fontSize: 18.0),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(), // Display specific error message
                    style: TextStyle(color: Colors.red[600]),
                  );
                }

                // Display a loading indicator while fetching version
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              'This is the developer build of the app.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
