import 'package:flutter/material.dart';
import 'package:ex3/data/profile_data.dart';
import 'ui/screen/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: ronanProfile),
  ));
}
