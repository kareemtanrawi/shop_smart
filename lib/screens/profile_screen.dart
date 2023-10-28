import 'package:e_commerce/providers/theme_provider.dart';
import 'package:e_commerce/screens/inner_screen/viewed_recently.dart';
import 'package:e_commerce/screens/inner_screen/wishlist.dart';
import 'package:e_commerce/services/myapp_function.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/app_name_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/shopping_cart.png'),
        ),
        title: const AppNameTextWidget(fontSize: 22),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: TitlesTextWidget(
                  label: 'Please login to have unlimited access',
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/128/3135/3135715.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(
                          label: 'Kareem Tantawi',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SubtitleTextWidget(
                            label: 'Coding.with.kareem@gmail.com')
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitlesTextWidget(
                    label: 'General',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListTitle(
                    text: 'All orders',
                    imagePath: 'assets/bag/order_svg.png',
                    function: () {},
                  ),
                  CustomListTitle(
                    text: 'Wishlist',
                    imagePath: 'assets/bag/wishlist_svg.png',
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routName);
                    },
                  ),
                  CustomListTitle(
                    text: 'Viewed recently',
                    imagePath: 'assets/profile/recent.png',
                    function: () {
                      Navigator.pushNamed(
                          context, ViewedRecentlyScreen.routName);
                    },
                  ),
                  CustomListTitle(
                    text: 'Address',
                    imagePath: 'assets/profile/address.png',
                    function: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitlesTextWidget(
                    label: 'Settings',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SwitchListTile(
                      secondary: Image.asset(
                        'assets/profile/theme.png',
                        height: 34,
                      ),
                      title: Text(
                        themeProvider.getIsDarkTheme
                            ? "Dark Theme"
                            : "Light Theme",
                        style: GoogleFonts.aBeeZee(),
                      ),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      }),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.login),
                label: Text(
                  'Login',
                  style: GoogleFonts.aBeeZee(),
                ),
                onPressed: () async {
                  await MyAppFunction.showErrorOrWarningDialog(
                      context: context,
                      fct: () {},
                      subtitle: 'Are you sure to sign out');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//custom text title
class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(
        label: text,
      ),
      leading: Image.asset(
        imagePath,
        height: 34,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
