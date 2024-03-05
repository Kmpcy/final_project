import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/main.dart';
import 'package:final_project/trailing(1)/password_confirm.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class Setting extends StatefulWidget {
  Setting({super.key});
   

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
          flexibleSpace: Center(
            child: Row(children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
        Text(
               S.of(context).Back,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ]),
          ),
          title:   Text(
           S.of(context).settings,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                children: [
                   Text(
                    S.of(context).DarkMode,
                    style: TextStyle(fontSize: 25),
                  ),
                  const Spacer(),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      AdaptiveTheme.of(context).toggleThemeMode();
                      },
                    ),
                  ],
              ),  
            ),  
            Row(  
              children  : [
                  Text(    
                  S.of(context).language,
                            
                  style: TextStyle(fontSize: 25),
                ),  
                const Spacer  (),
                Column(  
                  children: [
                    Container(
                      width: 200,
                        child: TextButton(
                          onPressed: () {
                       
                            setState(() {  S.  load(Locale('en', 'EN'));});
                           
                        },  
                        style:   TextButton.styleFrom(
                          shape:   const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            side: BorderSide
                                           (color: Colors.black87),
                          ),  
                          backgroundColor: Colors.white,
                          // fixed  Size: Size.fromWidth(10)
                        ),  
                        child: const   Text(
                          'English',  
                          style: TextStyle(
                            color: Colors.  black87, // Text color
                          ),  
                                                   
                        ),  
                                                   
                      ),  
                    ),  
                    // SizedBox(height: 0,  ),
                    Container(  
                      width: 200,  
                      child: TextButton(  
                        onPressed: (  ) {
                         
                          setState(()   {});
                             S.load(Locale('ar', 'AR'));
                        },  
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                height: 50,
                color: const Color(0xff055548),
                child:   Row(children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    S.of(context).profile,
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white)
                ]),
                onPressed: () {},
              ),
            ),     Expanded(child: PasswordForm()),
          ],
        ));
  }
}
