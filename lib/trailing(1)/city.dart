
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';


class City extends StatefulWidget {
    City({
    super.key,
  });

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
String countryValue = "";

late String? stateValue ;

late String? cityValue ;

String address = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).City,
    style: TextStyle(
        color: AppColor.greenColor, fontSize: 20)),
          SizedBox(width: 44),
       Expanded(child: Container(child:Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 130,
            child: ListView(
              children: [
           
                CSCPicker(
        
                  showStates: true,

                  
                  showCities: true,

                  
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                 
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 1)),

                  
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.grey.shade300, width: 1)),

                   
                  selectedItemStyle: TextStyle(color: Colors.black, fontSize: 14,),

       
                  dropdownHeadingStyle: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

                  
                  dropdownItemStyle: TextStyle(color: Colors.black,fontSize: 14, ),

                  
                  dropdownDialogRadius: 10.0,
 
                  searchBarRadius: 10.0,

             
                  onCountryChanged: (value) {
                    setState(() {
                     
                      countryValue = value;
                    });
                  },

                
                  onStateChanged: (value) {
                    setState(() {
                       
                      stateValue = value;
                    });
                  },

                  
                  onCityChanged: (value) {
                    setState(() {
                      
                      cityValue = value;
                    });
                  },
                ),

                
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: Text("")),
                Text(address)
              ],
            )),
      ),

)),
         
        ],
      ),
    );
  }
}
