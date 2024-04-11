import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/views/HomeScreen.dart';
import 'package:final_project/views/Setting.dart';
import 'package:final_project/views/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // void initState() {
  //   super.initState();
  //   _locale = Locale('en');
  // }

  // void dispose() {
  //   _locale = Locale('ar');
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return AdaptiveTheme(
          light: ThemeData(
            primarySwatch: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.black),
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          dark: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white),
            brightness: Brightness.dark,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            theme: theme,
            darkTheme: darkTheme,
            routes: {
              '/home': (context) => const HomeScreen(),
              '/setting': (context) => const Setting(),
              // other routes
            },
            localizationsDelegates: const [
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            debugShowCheckedModeBanner: false,
            home: const SignUpPage(),
            // Setting()
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switchValue = false;

  bool isTextFieldVisible = false;

  TextEditingController diagnosesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color(0xff055548),
          flexibleSpace: Center(
            child: Row(children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
              const Text(
                "Back",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ]),
          ),
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              color: Colors.white, // Background color of the screen
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .4,
                    left: -MediaQuery.of(context).size.width * .6,
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          .8, // Adjust the height as needed
                      width: MediaQuery.of(context).size.width *
                          1.45, // Adjust the width as needed
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff229b95), // Color of the circular shape
                      ),
                    ),
                  ),
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .44,
                    left: -MediaQuery.of(context).size.width * .64,
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          .82, // Adjust the height as needed
                      width: MediaQuery.of(context).size.width *
                          1.45, // Adjust the width as needed
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff2ab9b5), // Color of the circular shape
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 150, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.umbrella,
                          color: Colors.white,
                          size: 70,
                        ),
                        Spacer(),
                        Column(children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://scontent.fcai22-2.fna.fbcdn.net/v/t39.30808-6/409476334_6707694622686147_1642394985538472521_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=-bxHCQEOPUAAX9RGPnj&_nc_ht=scontent.fcai22-2.fna&oh=00_AfCu9GDay4O2bKOYvBQcVz04JFLa6Rh9C0xa_z1ITHxPYA&oe=65B067F0"),
                          ),
                          Text("Name",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600))
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 25),
                  ),
                  const Spacer(),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    "Language",
                    style: TextStyle(fontSize: 25),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              side: BorderSide(color: Colors.black87),
                            ),
                            backgroundColor: Colors.white,
                            // fixedSize: Size.fromWidth(10)
                          ),
                          child: const Text(
                            'English',
                            style: TextStyle(
                              color: Colors.black87, // Text color
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 0,),
                      SizedBox(
                        width: 200,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            side: const BorderSide(
                              color: Colors.black87,
                            ),
                            backgroundColor: Colors.white,
                            // fixedSize: Size.fromWidth(20)
                          ),
                          child: const Text(
                            'العربيه',
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                height: 50,
                color: const Color(0xff055548),
                child: const Row(children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white)
                ]),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  isTextFieldVisible = !isTextFieldVisible;
                });
              },
            ),
            if (isTextFieldVisible)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: diagnosesController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            const Text("ال Show table   "),
            Text(diagnosesController.text),
          ],
        ),
        bottomSheet: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xff055548),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 30,
                        )),
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        )),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
