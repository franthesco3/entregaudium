import 'package:entregaudium/api/routes/profile_router.dart';
import 'package:entregaudium/features/profile/profile_view_controller.dart';
import 'package:entregaudium/features/profile/profile_view_model.dart';
import 'package:entregaudium/features/profile/use_case/profile_use_case.dart';
import 'package:flutter/material.dart';

class ProfileFactory {
  static const String router = '/profile';

  static StatefulWidget profile() {
    final routes = ProfileRouter();
    final useCase = ProfileUseCase(routes: routes);

    final viewModel = ProfileViewModel(useCase: useCase);

    return ProfileViewController(viewModel: viewModel);
  }
}
