import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Sync",
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          // color: Theme.of(context)
                          //     .textTheme
                          //     .bodyText1
                          //     ?.color
                          //     ?.withOpacity(0.6),
                        ),
                  ),
                ),
                const Spacer(),
                Switch.adaptive(
                    value: value,
                    onChanged: (switchValue) {
                      setState(() {
                        value = switchValue;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
