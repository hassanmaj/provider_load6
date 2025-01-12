import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';  // استيراد النموذج

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),  // توفير النموذج
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),  // إكمال تعريف HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);  // الوصول إلى النموذج

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counter.count}',  // عرض قيمة العداد
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => counter.decrement(),  // تقليل العداد
                  child: Icon(Icons.remove),
                  tooltip: 'Decrement',
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () => counter.increment(),  // زيادة العداد
                  child: Icon(Icons.add),
                  tooltip: 'Increment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}