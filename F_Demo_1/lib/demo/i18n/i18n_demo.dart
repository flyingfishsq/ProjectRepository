import 'package:F_Demo_1/demo/i18n/intl/ninghao_demo_localizations.dart';
import 'package:flutter/material.dart';

class I18nDemo extends StatelessWidget {
  const I18nDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${locale.languageCode}',
            ),
            Text(
              '${locale.toString()}',
            ),
            Text(
              // Localizations.of(context, NingHaoDemoLocalizations).title,
              // NingHaoDemoLocalizations.of(context).title,
              NingHaoDemoLocalizations.of(context).greet('张三'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
