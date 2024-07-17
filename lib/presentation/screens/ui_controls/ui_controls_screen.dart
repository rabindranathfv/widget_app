import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls screen')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bus, train, airplane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selectTransp = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView(
      physics: const ClampingScrollPhysics(), // avoid bouncing
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('aditionals controls'),
            value: isDeveloperMode,
            onChanged: (value) {
              print('SwitchListTile value: $value');
              setState(() {
                isDeveloperMode = !isDeveloperMode;
              });
            }),
        ExpansionTile(
            title: const Text('Select Transportation '),
            subtitle: Text('current selection $selectTransp'),
            leading: Icon(Icons.directions_car, color: colors.primary),
            initiallyExpanded: true,
            backgroundColor: Color.fromARGB(255, 186, 213, 226),
            children: [
              RadioListTile(
                  title: const Text('Car transportation'),
                  subtitle: const Text('moving by road'),
                  value: Transportation.car,
                  groupValue: selectTransp,
                  onChanged: (value) {
                    setState(() {
                      selectTransp = Transportation.car;
                    });
                  }),
              RadioListTile(
                  title: const Text('Bus transportation'),
                  subtitle: const Text('moving by road'),
                  value: Transportation.bus,
                  groupValue: selectTransp,
                  onChanged: (value) {
                    setState(() {
                      selectTransp = Transportation.bus;
                    });
                  }),
              RadioListTile(
                  title: const Text('Train transportation'),
                  subtitle: const Text('moving by rail'),
                  value: Transportation.train,
                  groupValue: selectTransp,
                  onChanged: (value) {
                    setState(() {
                      selectTransp = Transportation.train;
                    });
                  }),
              RadioListTile(
                  title: const Text('Airplane transportation'),
                  subtitle: const Text('moving by air'),
                  value: Transportation.airplane,
                  groupValue: selectTransp,
                  onChanged: (value) {
                    setState(() {
                      selectTransp = Transportation.airplane;
                    });
                  }),
            ]),
        CheckboxListTile(
            title: const Text('Do you want breakfast'),
            subtitle: const Text('you have severals options'),
            value: wantsBreakfast,
            onChanged: (bool? vale) {
              print('CheckboxListTile value for breakfast: $vale');
              setState(() {
                wantsBreakfast = !wantsBreakfast;
              });
            }),
        CheckboxListTile(
            title: const Text('Do you want Lunch'),
            subtitle: const Text('you have severals options'),
            value: wantsLunch,
            onChanged: (bool? vale) {
              print('CheckboxListTile value for lunch: $vale');
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: const Text('Do you want Dinner'),
            subtitle: const Text('you have severals options'),
            value: wantsDinner,
            onChanged: (bool? vale) {
              print('CheckboxListTile value for dinner: $vale');
              setState(() {
                wantsDinner = !wantsDinner;
              });
            }),
      ],
    );
  }
}
