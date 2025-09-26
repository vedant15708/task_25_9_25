import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mediaQuery(),
    );
  }
}

class mediaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final safeTop = mediaQuery.padding.top;
    final safeBottom = mediaQuery.padding.bottom;
    final appBar = AppBar();
    final appBarHeight = appBar.preferredSize.height;

    final usableHeight = screenHeight - appBarHeight - safeTop - safeBottom;
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height of the screen: $screenHeight'),
            Text('Safe Area Top: $safeTop'),
            Text('Safe Area Bottom: $safeBottom'),
            Text('Safe Area Top and Bottom: ${safeTop + safeBottom}'),
            Text('AppBar height: $appBarHeight'),
            Text('Top Padding: $safeTop'),
            Text('Bottom Padding: $safeBottom'),
            Text('Usable Screen Height: $usableHeight'),
          ],
        ),
      ),
    );
  }
}
