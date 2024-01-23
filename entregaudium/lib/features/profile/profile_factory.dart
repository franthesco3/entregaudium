import 'package:entregaudium/features/profile/profile_view_controller.dart';
import 'package:entregaudium/features/profile/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileFactory {
  static const String router = '/profile';

  static StatefulWidget profile() {
    final viewModel = ProfileViewModel();

    return ProfileViewController(viewModel: viewModel);
  }
}
