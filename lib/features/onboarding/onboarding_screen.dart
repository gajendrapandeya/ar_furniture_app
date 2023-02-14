import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/storage_provider.dart';
import 'package:ar_furniture_app/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final onboardingCurrentIndexProvider = StateProvider<int>((ref) => 0);

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<OnboardingWidget> _onBoardingItems = [
    const OnboardingWidget(
      assetPath: AssetConstants.sittingOnSofa,
      mainText: 'Modern Furniture For Your Home',
      subText:
          'Browse and search your new style from our premium and designers brand.',
    ),
    const OnboardingWidget(
      assetPath: AssetConstants.furnish,
      mainText: 'Virtually Furnish Your Home',
      subText:
          'Use our augmented reality camera to try the furniture in real time.',
    ),
    const OnboardingWidget(
      assetPath: AssetConstants.comfort,
      mainText: 'Get Furniture That Gives Comfort',
      subText: '',
    )
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int pageIndex) {
                  ref
                      .read(onboardingCurrentIndexProvider.notifier)
                      .update((state) => state = pageIndex);
                },
                controller: _pageController,
                itemCount: _onBoardingItems.length,
                itemBuilder: ((_, index) => _onBoardingItems[index]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.secondary,
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Colors.grey.shade400,
                  ),
                  onDotClicked: (index) {},
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    /// Done text is present
                    if (ref.read(onboardingCurrentIndexProvider) ==
                        _onBoardingItems.length - 1) {
                      ref.read(storageProvider).setOnboardingCompleted();
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteConstants.loginRoute,
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    ref.watch(onboardingCurrentIndexProvider) !=
                            _onBoardingItems.length - 1
                        ? 'Skip'
                        : 'Done',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
