import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/consts/app_constant.dart';
import 'package:e_commerce/providers/theme_provider.dart';
import 'package:e_commerce/widgets/app_name_text.dart';
import 'package:e_commerce/widgets/product/ctg_rounded_widget.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/product/latest_arrival.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/shopping_cart.png'),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      // backgroundColor: AppColors.lightScaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(50),
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.red,
                      color: Colors.white,
                    )),

                    // control: SwiperControl(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const TitlesTextWidget(
                label: 'Latest arrival',
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: productProvider.getProduct[index],
                        child: const LastArrivalProductWidget());
                  },
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              const TitlesTextWidget(label: 'Categories'),
              const SizedBox(
                height: 15,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                    List.generate(AppConstants.categoriesList.length, (index) {
                  return CategoryRoundedWidget(
                    image: AppConstants.categoriesList[index].image,
                    name: AppConstants.categoriesList[index].name,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
