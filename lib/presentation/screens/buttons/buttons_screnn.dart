import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatefulWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elaveted Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elaveted Button Disabled')),
            ElevatedButton.icon(
              icon: const Icon(Icons.access_alarm_rounded),
              onPressed: () {},
              label: const Text('elevated Icon'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('filled'),
            ),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_time),
                label: const Text('filled Icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cloud_circle),
                label: const Text('Outline icon')),
            TextButton(onPressed: () {}, child: const Text('Text btn')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.watch_later),
                label: const Text('Text btn')),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.face_2_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.face_2_sharp),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: const WidgetStatePropertyAll(Colors.white)),
            ),

            // TODO: Custom Btn
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom BTN'),
          ),
        ),
      ),
    );
  }
}
