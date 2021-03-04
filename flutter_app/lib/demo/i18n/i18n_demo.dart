import 'package:flutter/material.dart';

import 'map/i18n_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(I18nDemoLocalizations.of(context).title)],
        ),
      ),
    );
  }
}
