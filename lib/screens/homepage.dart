import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsafe/screens/homecards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Provider<String>.value(
      value: '+915555555555',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SosButton(heigth: heigth, width: width),
              const SizedBox(height: 10),
              const ContactCard(),
              const SizedBox(
                height: 8,
              ),
              Row(children: const [
                Expanded(
                  child: BgCard(),
                ),
                Expanded(
                  child: SmsCard(),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
