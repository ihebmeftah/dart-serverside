import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddquestionView extends GetView {
  const AddquestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddquestionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddquestionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
