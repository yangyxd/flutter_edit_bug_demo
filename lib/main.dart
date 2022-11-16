import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '文本框 Bug Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? font;
  String text = '';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              const Text(
                '输入、粘贴、设置的中文内容，有时候会变成方块符号。\nThe Chinese content you input, paste, and set will sometimes become square symbols.',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('font: '),
                  Checkbox(value: font == null, onChanged: (v) {
                    setState(() => font = null);
                  }),
                  const Text('默认  '),
                  Checkbox(value: font == 'Roboto', onChanged: (v) {
                    setState(() => font = 'Roboto');
                  }),
                  const Text('Roboto  '),
                  Checkbox(value: font == 'DroidSansMono', onChanged: (v) {
                    setState(() => font = 'DroidSansMono');
                  }),
                  const Text('DroidSansMono'),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                style: TextStyle(fontFamily: font, fontSize: 14),
                minLines: 2,
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                    labelText: "text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    suffixIcon: GestureDetector(
                      child: const Tooltip(
                        message: "clear",
                        child: Icon(Icons.clear, size: 16),
                      ),
                      onTap: () {
                        controller.clear();
                        onChanged("");
                      },
                    )
                ),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChanged(String text) {
    this.text = text;
  }
}
