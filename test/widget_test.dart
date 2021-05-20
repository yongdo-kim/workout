// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yd_workout_program/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// : auto_route, get_it, hive
//fvm flutter packages pub run build_runner build




// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<HomeViewModel>.reactive(
//       viewModelBuilder: () => HomeViewModel(),
//       onModelReady: (model) => model.initialize(),
//       builder: (context, viewModel, child) => Scaffold(
//         body: Center(
//           child: Text(""),
//         ),
//       ),
//     );
//   }
// }
// // ViewModel
// import 'package:flutter/material.dart';
//
// class HomeViewModel extends ChangeNotifier {
//
//   void initialize() {
//     notifyListeners();
//   }
//
// }

//viewmodelWidget
//class TitleSection extends ViewModelWidget<HomeViewModel> {
//   @override
//   Widget build(BuildContext context, HomeViewModel viewModel) {
//     return Row(
//       children: <Widget>[
//         Text(
//           'Title',
//           style: TextStyle(fontSize: 20),
//         ),
//         Container(
//           child: Text(viewModel.title),
//         ),
//       ],
//     );
//   }
// }