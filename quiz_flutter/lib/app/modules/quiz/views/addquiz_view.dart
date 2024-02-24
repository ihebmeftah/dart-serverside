import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddquizView extends GetView {
  const AddquizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddquizView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddquizView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
