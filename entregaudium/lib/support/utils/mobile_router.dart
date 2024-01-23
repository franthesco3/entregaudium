import 'package:entregaudium/features/profile/profile_factory.dart';
import 'package:flutter/material.dart';

class MobileRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    ProfileFactory.router: (_) {
      return ProfileFactory.profile();
    }
  };
}
