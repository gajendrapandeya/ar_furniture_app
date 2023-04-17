import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  List<Step> stepList() => [
        const Step(
            title: Text('Account'),
            content: Center(
              child: Text('Account'),
            )),
        const Step(
            title: Text('Address'),
            content: Center(
              child: Text('Address'),
            )),
        const Step(
            title: Text('Confirm'),
            content: Center(
              child: Text('Confirm'),
            )),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(MdiIcons.chevronLeft),
        ),
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          VerticalSpacer.xxl,
          Expanded(
            child: _buildStepper(),
          )
        ],
      ),
    );
  }

  Widget _buildStepper() {
    int activeStep = 1;
    return EasyStepper(
      activeStep: activeStep,
      lineLength: 50,
      stepShape: StepShape.rRectangle,
      stepBorderRadius: 15,
      borderThickness: 2,
      // padding: 20,
      stepRadius: 28,
      finishedStepBorderColor: Colors.deepOrange,
      finishedStepTextColor: Colors.deepOrange,
      finishedStepBackgroundColor: Colors.deepOrange,
      activeStepIconColor: Colors.deepOrange,
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: Image.asset('assets/1.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 1',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Image.asset('assets/2.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 2',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Image.asset('assets/3.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 3',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 3 ? 1 : 0.3,
              child: Image.asset('assets/4.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 4',
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 4 ? 1 : 0.3,
              child: Image.asset('assets/5.png'),
            ),
          ),
          customTitle: const Text(
            'Dash 5',
            textAlign: TextAlign.center,
          ),
        ),
      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
