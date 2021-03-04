import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.black),
                child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (int step) {
                      setState(() {
                        _currentStep = step;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                      });
                    },
                    steps: [
                      Step(
                          title: Text('Register'),
                          subtitle: Text('Register First'),
                          content: Text('年少不知富婆香'),
                          isActive: _currentStep == 0),
                      Step(
                          title: Text('Login'),
                          subtitle: Text('Login Secondary'),
                          content: Text('错把青春倒插秧'),
                          isActive: _currentStep == 1),
                      Step(
                          title: Text('Change'),
                          subtitle: Text('Change Third'),
                          content: Text('你说有没有道理'),
                          isActive: _currentStep == 2)
                    ]))
          ],
        ),
      ),
    );
  }
}
