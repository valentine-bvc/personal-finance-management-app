import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/about/about_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) {
        final appName = model.packageInfo?.appName ?? "Finance Buddy";
        final appVersion = model.packageInfo != null
            ? "${model.packageInfo!.version}+${model.packageInfo!.buildNumber}"
            : "0.0.0";

        return Scaffold(
          appBar: const CustomAppBar(
            title: Text("About"),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpaceMediumPlus,
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: customTheme.appBarBackgroundColor,
                    child: const Image(image: APP_LOGO_ASSET_IMAGE),
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  appName,
                  style: cardTitleStyle,
                ),
                verticalSpaceTiny,
                Text(
                  "Version $appVersion",
                  style: cardSubTitleStyle,
                ),
                verticalSpaceRegular,
                _buildAboutContent(model: model, customTheme: customTheme),
              ],
            ),
          ),
        );
      },
    );
  }

  TextSpan _buildTextSpanLink({
    required String text,
    required Uri uri,
    required void Function() onTap,
  }) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  Widget _buildAboutContent({
    required AboutViewModel model,
    required CustomTheme customTheme,
  }) {
    final walletAppURI = Uri.parse("https://budgetbakers.com/");
    final splitwiseAppURI = Uri.parse("https://www.splitwise.com/");
    final bucketsAppURI = Uri.parse("https://www.budgetwithbuckets.com/");

    final style = TextStyle(color: customTheme.primaryTextColor);

    return _buildCard(
      children: [
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: [
              TextSpan(
                text: "An open-source, free budgeting app inspired by a popular apps, like ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Wallet",
                uri: walletAppURI,
                onTap: () => model.onTapLink(walletAppURI),
              ),
              TextSpan(
                text: ", ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Splitwise",
                uri: splitwiseAppURI,
                onTap: () => model.onTapLink(splitwiseAppURI),
              ),
              TextSpan(
                text: " and ",
                style: style,
              ),
              _buildTextSpanLink(
                text: "Buckets",
                uri: bucketsAppURI,
                onTap: () => model.onTapLink(bucketsAppURI),
              ),
              TextSpan(
                text:
                    ". Designed to provide an easy-to-use solution for managing personal finances. The app allows users to categorize expenses, set budgets, and track spending, as well as reach savings goals. With a user-friendly interface, this app is perfect for individuals looking to take control of their finances.",
                style: style,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildCard({required List<Widget> children}) {
  return Card(
    margin: const EdgeInsets.all(10),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: children,
      ),
    ),
  );
}
