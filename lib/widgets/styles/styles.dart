

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomStyles {
 

  TextStyle mealNameButton() =>
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  TextStyle descriptionButton() =>
    TextStyle(fontSize: 19);
  
  TextStyle yellowButton() =>
    TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black54);  

  TextStyle time() =>
    TextStyle(fontSize: 30); 

  TextStyle noAvailable() =>
    TextStyle(fontSize: 35);
}