import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  void _launchEmail() async {
    final uri = Uri(scheme: 'mailto', path: 'kashishdarji25@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchPhone() async {
    final uri = Uri(scheme: 'tel', path: '+91 9904225520');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchMap() async {
    final uri = Uri.parse('https://www.google.com/maps/@22.3271785,72.6116519,119m/data=!3m1!1e3?authuser=0&entry=ttu&g_ep=EgoyMDI1MDUxMi4wIKXMDSoASAFQAw%3D%3D');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(title: const Text("About the App"),
        backgroundColor:Colors.indigo[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
          
                Padding(
                  padding: const EdgeInsets.only(left: 30, ),
                  child: Image.asset("assets/logo.png", height: 300,width: 300,),
                ),
          
            
            const SizedBox(height: 12),
            const Text(
              "Student LMS is a platform to manage your learning, subjects, schedules, and more efficiently.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email, color: Color.fromARGB(255, 120, 128, 170)),
              title: const Text("kashishdarji25@gmail.com"),
              onTap: _launchEmail,
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Color.fromARGB(255, 120, 128, 170)),
              title: const Text("+91 9904225520"),
              onTap: _launchPhone,
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color.fromARGB(255, 120, 128, 170)),
              title: const Text("Khambhat, Gujarat, India"),
              onTap: _launchMap,
            ),
          ],
        ),
      ),
    );
  }
}
