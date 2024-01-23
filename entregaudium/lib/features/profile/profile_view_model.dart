import 'package:entregaudium/features/profile/profile_view_controller.dart';
import 'package:entregaudium/features/profile/use_case/profile_use_case.dart';
import 'package:entregaudium/models/user.dart';

class ProfileViewModel extends ProfileProtocol {
  User? _user;
  bool _error = false;
  bool _isLoading = false;
  final ProfileUseCaseProtocol useCase;

  ProfileViewModel({required this.useCase});

  @override
  bool get loading => _isLoading;

  @override
  bool get hasErro => _error;

  @override
  String get name => _user?.name ?? '';

  @override
  String get cargo => _user?.cargo ?? '';

  @override
  String get description => _user?.description ?? '';

  @override
  void getData() {
    _setLoading(true);
    useCase.execute(
      success: (user) {
        _user = user;
        _setLoading(false);
      },
      failure: (error) {
        _error = true;
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool loading) {
    _isLoading = loading;

    notifyListeners();
  }
}
