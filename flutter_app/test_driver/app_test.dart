import 'dart:async';
import 'dart:io';

// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:io';


void main() {
  group('计数器测试', () {

    final counterTextFinder = find.byValueKey('counter');
    FlutterDriver driver;

    setUpAll(() async {
      // 连接app
      driver = await FlutterDriver.connect();

      // 休眠2秒
      await sleep(Duration(seconds: 2));

    });

    tearDownAll(() async {
      if (driver != null) {
        // 关闭连接
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      print("点击 add Icon");
      driver.tap(find.byTooltip("Increment"));

      print("断言计数器加以");
      expect(await driver.getText(counterTextFinder),  "1");

    });
  });
}
