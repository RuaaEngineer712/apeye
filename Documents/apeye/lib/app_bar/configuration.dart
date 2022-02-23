import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'all', 'iconPath' : 'assets/images/view.png'},
  {'name': 'News', 'iconPath' : 'assets/images/new-icon.png'},
  {'name': 'Jobs', 'iconPath': 'assets/images/job-icon.png'},
  {'name': 'Courses', 'iconPath': 'assets/images/course-icon.png'},
  // {'name': 'Parrots', 'iconPath': 'assets/images/jobs.jpg'},
  // {'name': 'Horses', 'iconPath': 'assets/images/jobs.jpg'}
];

List<Map> drawerItems=[
  {
    
    'icon': Icons.person,
    'title' : 'profile'
  },
  {
    'icon': Icons.settings,
    'title' : 'setting'
  },

  {
    'icon': Icons.mail,
    'title' : 'about us'
  },
  {
    'icon': Icons.logout,
    'title' : 'log out'
  },
  
];