import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/font_asset.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding screens
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: const [
              OnboardingPage(
                imagePath: 'assets/images/background_sigmaty.png',
                title: '',
                description:
                    'مع اسهل طرق التعلم وسهولة الاستخدام للوصل الى افضل المدرسيين',
              ),
              OnboardingPage(
                imagePath: 'assets/images/background_sigmaty.png',
                title: '',
                description:
                    'مع اسهل طرق التعلم وسهولة الاستخدام للوصل الى افضل المدرسيين',
              ),
              OnboardingPage(
                imagePath: 'assets/images/background_sigmaty.png',
                title: ' ',
                description:
                    'مع اسهل طرق التعلم وسهولة الاستخدام للوصل الى افضل المدرسيين',
              ),
            ],
          ),

          // SmoothPageIndicator and buttons inside the image
          Positioned(
            bottom:
                50, // Adjust this to control position of buttons and indicator
            left: 0,
            right: 0,
            child: Column(
              children: [
                // SmoothPageIndicator
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: 24,
                      dotHeight: 6,
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),

                const SizedBox(
                    height: 20), // Spacing between indicator and buttons

                // Buttons for navigation
                Padding(
                    padding: const EdgeInsets.only(left: 270.0),
                    child: _currentIndex < 2
                        ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue,
                                  size: 25), // يمكنك تخصيص الأيقونة كما تريد
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                        )
                        : ElevatedButton(
                            onPressed: () {
                              context.pushReplacement('/FeaturesUser');
                            },
                            child: Text('التالي',style:FontAsset.font16WeightSemiBold.copyWith(color: Colors.blue)),
                          ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover, // Make the image cover the entire screen
            ),
          ),
        ),

        // Dark overlay for better text visibility
        Container(
          decoration: const BoxDecoration(
            //color: Colors.black.withOpacity(0.5), // Dark overlay
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(description,
                      textAlign: TextAlign.end,
                      style: FontAsset.font32WeightSemiBold
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Welcome to the app!")),
    );
  }
}
