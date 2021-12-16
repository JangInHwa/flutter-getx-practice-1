import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      getPages: [
        GetPage(name: '/next', page: () => const NextPage()),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Example'),
      ),
      body: ListView(
        children: [
          TextButton(
            child: const Text('Get.to()'),
            onPressed: () {
              Get.to(() => const NextPage());
            },
          ),
          TextButton(
            child: const Text('Get.toNamed()'),
            onPressed: () {
              Get.toNamed('/next');
            },
          ),
          TextButton(
            child: const Text('Get.off()'),
            onPressed: () {
              Get.to(() => const GetOffPage());
            },
          ),
          TextButton(child: const Text('Get.offAll()'), onPressed: () {}),
          TextButton(
            child: const Text('Get.snackbar()'),
            onPressed: () {
              Get.snackbar('Snackbar title', 'Hello World!');
            },
          ),
          TextButton(
            child: const Text('Get.showSnackbar()'),
            onPressed: () {
              Get.showSnackbar(const GetSnackBar(
                title: 'snackbar title',
                message: 'snackbar content',
                duration: Duration(seconds: 2),
              ));
            },
          ),
          TextButton(
            child: const Text('Get.defaultDialog()'),
            onPressed: () {
              Get.defaultDialog(title: 'Dialog title', middleText: 'content');
            },
          ),
          TextButton(child: const Text('Get.dialog()'), onPressed: () {}),
          TextButton(child: const Text('Get.bottomSheet()'), onPressed: () {}),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Get.back()'),
          ),
        ],
      ),
    );
  }
}

class GetOffPage extends StatelessWidget {
  const GetOffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetoffPage'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Get.off() to NextPage'),
          onPressed: () {
            Get.off(() => const NextPage());
          },
        ),
      ),
    );
  }
}
