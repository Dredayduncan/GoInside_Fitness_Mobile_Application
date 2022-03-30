import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

class CustomStatusAlert {

  void show({context, required String title, required String subtitle, required IconData icon, required Color backgroundColor, required Color color}){
    StatusAlert.show(
      context,
      backgroundColor: backgroundColor,
      titleOptions: StatusAlertTextConfiguration(
          style: TextStyle(
              color: color
          )
      ),
      subtitleOptions: StatusAlertTextConfiguration(
          style: TextStyle(
              color: color
          )
      ),
      duration: const Duration(seconds: 2),
      title: title,
      subtitle: subtitle,
      configuration: IconConfiguration(
          icon: icon,
          color: color
      ),
    );
  }
}