import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello, I am a snackbar'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar,
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Commodo laborum cillum cupidatat Lorem voluptate cupidatat tempor sit. Nulla officia aliquip eu fugiat proident ea nostrud amet eiusmod. Id excepteur culpa anim aliquip ullamco dolore veniam duis anim sint labore. Tempor reprehenderit in labore incididunt laboris dolor non elit laboris exercitation eiusmod id in.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar and Dialogs screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text('Proident anim ea aliqua magna ipsum tempor eu reprehenderit sunt. Sit cillum reprehenderit laborum duis amet aliqua deserunt laborum adipisicing labore cupidatat. Voluptate aliquip dolor nisi commodo voluptate do eu voluptate ipsum tempor occaecat irure officia officia. Ex incididunt laboris aute aliqua voluptate aliqua pariatur ea sint incididunt. Tempor excepteur ad in veniam eiusmod nostrud aute id anim eu. Consequat Lorem ex adipisicing non fugiat ex reprehenderit esse minim incididunt. Culpa commodo dolore qui laboris.'),
                  ]);
                },
                child: const Text('Used Licenses')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                }, child: const Text('Show diag')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
