import 'package:entregaudium/support/componets/item_description.dart';
import 'package:flutter/material.dart';

abstract class ProfileViewModelProtocol extends ChangeNotifier {
  String get name;
  String get cargo;
  bool get loading;
  bool get hasErro;
  String get amount;
  String get description;

  void getData();
}

class ProfileView extends StatelessWidget {
  final ProfileViewModelProtocol viewModel;

  const ProfileView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.hasErro) {
            return const Center(child: Text('Ocorreu um erro inesperado'));
          }
          return Column(
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
                    padding:
                        const EdgeInsets.only(left: 24, top: 24, bottom: 20),
                    width: mWidth,
                    color: Colors.blue.withOpacity(0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          viewModel.cargo,
                          style: const TextStyle(
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
                        viewModel.description,
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
                            const ItemDescription(
                              label: 'Entregas',
                              path: 'assets/images/ic_entregas.png',
                              value: '0',
                            ),
                            ItemDescription(
                              label: 'Saldo',
                              path: 'assets/images/ic_saldo.png',
                              value: 'R\$ ${viewModel.amount}',
                            ),
                            const ItemDescription(
                              label: 'Nota',
                              path: 'assets/images/ic_nota.png',
                              value: '0',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
