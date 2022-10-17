import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_strings.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  /// List of Data PageView
  late final List<SliderObject> _list = _getSliderData();

  /// controller for PageView Controller
  final PageController _pageController = PageController();

  /// Current PageView
  int currentIndex = 0;

  /// Function Return Title, Subtitle and image Data form AppString and ImageAssets for PageView
  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: ImagesAssets.onBoardingLogo1),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.onBoardingSubTitle2,
            image: ImagesAssets.onBoardingLogo2),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.onBoardingSubTitle3,
            image: ImagesAssets.onBoardingLogo3),
        SliderObject(
            title: AppStrings.onBoardingTitle4,
            subTitle: AppStrings.onBoardingSubTitle4,
            image: ImagesAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: ColorsManger.white,
        ),
        elevation: 0,
        backgroundColor: ColorsManger.white,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          /// Return PageView Item (OnBoardingItem)
          return OnboardingItem(sliderObject: _list[index]);
        },
      ),

      /// Bottom Sheet Indicator PageView
      bottomSheet: Container(
        color: ColorsManger.white,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Skip Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            ),

            /// indicator Slider Icons
            _getIconsIndicators()
          ],
        ),
      ),
    );
  }

  /// return Container for all icon bottom left, right arrow and solid, hollow circle icons
  Widget _getIconsIndicators() {
    return Container(
      color: ColorsManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Arrow Icon
          _arrowIcon(
            icon: ImagesAssets.leftArrowIc,
            onTap: () {
              /// Get previous slide
              _pageController.animateToPage(_getPreviousIndex(),
                  duration:
                      const Duration(milliseconds: AppConstants.milliseconds),
                  curve: Curves.bounceInOut);
            },
          ),

          /// Circles Indicators
          Row(children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getCircleIcon(i)),
          ]),

          /// Left Arrow Icon
          _arrowIcon(
            icon: ImagesAssets.rightArrowIc,
            onTap: () {
              /// Get Next slide
              _pageController.animateToPage(_getNextIndex(),
                  duration:
                      const Duration(milliseconds: AppConstants.milliseconds),
                  curve: Curves.bounceInOut);
            },
          ),
        ],
      ),
    );
  }

  /// Get previous Index to go to previous PageView
  int _getPreviousIndex() {
    int previousIndex = currentIndex--;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  /// Get previous Index to go to Next PageView
  int _getNextIndex() {
    int nextIndex = currentIndex++;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  /// return Circle Icons hollow or solid icon
  Widget _getCircleIcon(int index) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImagesAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImagesAssets.solidCircleIc);
    }
  }

  // return icon bottom left, right arrow
  Padding _arrowIcon({required String icon, required Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: InkWell(
        onTap: () {
          onTap!();
        },
        child: SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({Key? key, required this.sliderObject})
      : super(key: key);
  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.s100),
        /// Text Title
        Text(
          sliderObject.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: AppSize.s18),

        /// Text SubTitle
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s50),

        /// Image
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
