import 'package:entregaudium/features/profile/profile_view_controller.dart';
import 'package:entregaudium/features/profile/use_case/profile_use_case.dart';
import 'package:entregaudium/models/user.dart';

class ProfileViewModel extends ProfileProtocol {
  User? _user;
  bool _error = false;
  double _amount = 0.0;
  double _assessment = 0.0;
  int _delivery = 0;
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
  String get amount => _amount.toString();

  @override
  String get assessment => _assessment.toString();

  @override
  String get delivery => _delivery.toString();

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
        _amountTotal();
        _calAssessment();
        _calDelivery();
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

  void _amountTotal() {
    double total = 0.0;

    List.generate(_user!.historic.length, (index) {
      final historic = _user!.historic[index];

      total += historic.value;
    });

    _amount = total;

    notifyListeners();
  }

  void _calAssessment() {
    double total = 0.0;

    List.generate(_user!.historic.length, (index) {
      final historic = _user!.historic[index];

      total += historic.assesment?.toInt() ?? 0;
    });

    _assessment = total / _user!.historic.length;

    notifyListeners();
  }

  void _calDelivery() {
    int total = 0;

    List.generate(_user!.historic.length, (index) {
      final historic = _user!.historic[index];

      total += historic.delivery?.toInt() ?? 0;
      print('ESTRELAS: ${historic.delivery}');
    });

    _delivery = total;

    notifyListeners();
  }
}
