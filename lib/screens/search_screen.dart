import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product/product_widget.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> productListSearch = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedcategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    // ignore: unnecessary_null_comparison
    List<ProductModel> productList = passedcategory == null
        ? productProvider.products
        : productProvider.findByCategory(categoryName: passedcategory);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/shopping_cart.png'),
          ),
          title: TitlesTextWidget(label: passedcategory ?? "Search products"),
        ),
        body: productList.isEmpty
            ? const Center(child: TitlesTextWidget(label: "No product found"))
            :
            // const Center(child: TitlesTextWidget(label: 'No Product Found'))
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              searchTextController.clear();
                            },
                            child: const Icon(
                              Icons.clear,
                              color: Colors.red,
                            )),
                      ),
                      onChanged: (value) {
                        //   setState(() {
                        //     productListSearch = productProvider.searchQuary(
                        //         searchText: searchTextController.text);
                        //   });
                        // },
                      },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuary(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                          child: TitlesTextWidget(label: 'No Product found'))
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        physics: const BouncingScrollPhysics(),
                        builder: (context, index) {
                          return ProductWidget(
                              productId: searchTextController.text.isNotEmpty
                                  ? productListSearch[index].productId
                                  : productList[index].productId);
                        },
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
