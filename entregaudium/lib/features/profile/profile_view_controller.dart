import 'package:entregaudium/features/profile/profile_view.dart';
import 'package:flutter/material.dart';

abstract class ProfileProtocol extends ProfileViewModelProtocol {}

class ProfileViewController extends StatefulWidget {
  final ProfileProtocol viewModel;

  const ProfileViewController({super.key, required this.viewModel});

  @override
  State<ProfileViewController> createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileView(viewModel: widget.viewModel);
  }
}
