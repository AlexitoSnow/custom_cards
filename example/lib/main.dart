import 'package:flutter/material.dart';
import 'package:custom_cards/custom_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Cards Demo',
      home: const MyHomePage(title: 'Custom Cards Demo'),
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TitledCard(
                title: 'Titled Card',
                subtitle: 'This is a titled card',
              ),
              const InputCard(
                title: 'Input Card',
                description: 'Enter your name',
                trailing: Icons.person,
              ),
              const Row(
                children: [
                  Expanded(
                    child: InputCard(
                      title: 'Input Card',
                      description: 'Enter your name',
                      trailing: Icons.person,
                    ),
                  ),
                  Expanded(
                    child: TitledCard(
                      title: 'Titled Card',
                      subtitle: 'This is a titled card',
                    ),
                  ),
                  Expanded(
                    child: InputCard(
                      title: 'Input Card',
                      description: 'Enter your name',
                      trailing: Icons.person,
                    ),
                  ),
                ],
              ),
              DatedCard(
                  title: 'Dated Card',
                  controller: TextEditingController(),
                  onDatePicked: (date) {}),
              CardChoiceRow(
                  title: 'Card Choice Row',
                  description: 'Choose one',
                  items: Map.fromIterables(
                    ['Option 1', 'Option 2', 'Option 3'],
                    [false, true, false],
                  )),
              const Text(
                  'Raw Custom Cards | Content or Subtitle, but not both'),
              const RawCustomCard(
                title: 'Raw Custom Card with Content',
                content: FlutterLogo(),
              ),
              const RawCustomCard(
                title: 'Raw Custom Card with Subtitle',
                subtitle: 'This is a subtitle',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
