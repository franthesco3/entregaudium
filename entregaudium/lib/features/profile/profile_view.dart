import 'package:entregaudium/support/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class ProfileViewModelProtocol extends ChangeNotifier {}

class ProfileView extends StatelessWidget {
  final ProfileViewModelProtocol viewModel;

  const ProfileView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: mHeigth / 1.5,
                child: Image.asset(
                  'assets/images/img_entregador.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 24, top: 24, bottom: 20),
                width: mWidth,
                color: Colors.blue.withOpacity(0.7),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Augusto Prado',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Coletor',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 20,
                    right: 24,
                    bottom: 35,
                  ),
                  color: Colors.blue,
                  child: Text(
                    Constants.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/ic_entregas.png'),
                        Image.asset('assets/images/ic_saldo.png'),
                        Image.asset('assets/images/ic_nota.png'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
