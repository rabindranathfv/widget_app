import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Going for the food',
      caption: 'Et mollit laboris tempor nostrud esse duis qui.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'fast delivery',
      caption:
          'Esse pariatur irure Lorem do. Ipsum nostrud esse elit duis dolor occaecat laboris veniam laboris mollit ex laborum do est. Mollit ad deserunt esse adipisicing est deserunt culpa Lorem voluptate Lorem sunt cillum laboris qui. Nostrud eu Lorem minim laboris tempor do. Ipsum culpa enim fugiat aliquip irure nostrud nisi ullamco sunt sit excepteur consectetur adipisicing ex. Enim voluptate tempor amet officia aliquip ex laborum amet sunt commodo cillum reprehenderit reprehenderit ad.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Enjoy your meal',
      caption: 'Eu ipsum dolor qui voluptate.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool lastStep = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!lastStep && page >= (slides.length - 1.5)) {
        setState(() {
          lastStep = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app tutorial screen')),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          lastStep ?
          Positioned(
            bottom: 35,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () {},
                child: const Text('start tutorial'),
              ),
            ),
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      )),
    );
  }
}
