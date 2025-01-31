import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => SettingState();
}

class SettingState extends State<Setting> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xff055548),
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context, '/home');
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Text(
                S.of(context).Back,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        title: Text(
          S.of(context).settings,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Row(
              children: [
                Text(
                  S.of(context).DarkMode,
                  style: const TextStyle(fontSize: 25),
                ),
                const Spacer(),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                      AdaptiveTheme.of(context).toggleThemeMode();
                    });
                  },
                ),
              ],
            ),
          ),

          Row(
            children: [
              Text(
                S.of(context).language,
                style: const TextStyle(fontSize: 25),
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          S.load(const Locale('en', 'EN'));
                        });
                      },
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                        ),
                        side: const BorderSide(color: Colors.black87),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'English',
                        style: TextStyle(
                          color: Colors.black87, // Text color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          S.load(const Locale('ar', 'AR'));
                        });
                      },
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        side: const BorderSide(color: Colors.black87),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'العربية',
                        style: TextStyle(
                          color: Colors.black87, // Text color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: MaterialButton(
              height: 50,
              color: const Color(0xff055548),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    S.of(context).profile,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white),
                ],
              ),
              onPressed: () {},
            ),
          ),
          // Expanded(
          //   child: PasswordForm(),
          // ),
        ],
      ),
    );
  }
}
