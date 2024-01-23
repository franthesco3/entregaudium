import 'package:entregaudium/api/routes/profile_router.dart';

import '../../../models/user.dart';

typedef Failure = void Function(String error);
typedef Success = void Function(User user);

abstract class ProfileUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class ProfileUseCase extends ProfileUseCaseProtocol {
  final ProfileRouterProtocol routes;

  ProfileUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getProfile(
      success: (result) {
        try {
          final user = User.fromMap(result['response']);
          success?.call(user);
        } on Error catch (error) {
          failure?.call(error.stackTrace.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message.toString());
      },
    );
  }
}
