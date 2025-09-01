import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_strings.dart';

class OnBoardingModel {
  String image;
  String title;
  String subTitle;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> OnBoardingData = [
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding1,
    title: AppStrings.onboardingheadlinefirstPage,
    subTitle: AppStrings.onboardingDescriptionFirstPage,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding2,
    title: AppStrings.onboardingheadlinesecondPage,
    subTitle: AppStrings.onboardingDescriptionsecondPage,
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding,
    title: AppStrings.onboardingHeadlineThirdPage,
    subTitle: AppStrings.onboardingDescriptionThirdPage,
  ),
];
