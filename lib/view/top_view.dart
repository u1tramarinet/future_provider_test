import 'package:flutter/material.dart';
import 'package:future_provider_test/view/option_view.dart';

class TopView extends StatefulWidget {
  const TopView({super.key});

  @override
  State<TopView> createState() => TopState();
}

class TopState extends State<TopView> {

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const OptionView();
            }));
          }, child: const Text('async option setting'),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Screen'),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: double.infinity,
        child: _body(context),
      ),
    );
  }

}