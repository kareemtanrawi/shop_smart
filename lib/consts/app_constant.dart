import '../models/category_model.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannersImages = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: 'phones',
      name: 'Phones',
      image: 'assets/categories/mobiles.png',
    ),
    CategoriesModel(
      id: 'Laptops',
      name: 'Laptops',
      image: 'assets/categories/pc.png',
    ),
    CategoriesModel(
      id: 'Electronics',
      name: 'Electronics',
      image: 'assets/categories/electronics.png',
    ),
    CategoriesModel(
      id: 'Watch',
      name: 'Watch',
      image: 'assets/categories/watch.png',
    ),
    CategoriesModel(
      id: 'Clothes',
      name: 'Clothes',
      image: 'assets/categories/fashion.png',
    ),
    CategoriesModel(
      id: 'Books',
      name: 'Books',
      image: 'assets/categories/book_img.png',
    ),
    CategoriesModel(
      id: 'shoes',
      name: 'shoes',
      image: 'assets/categories/shoes.png',
    ),
    CategoriesModel(
      id: 'assets/categories/mobiles.png',
      name: 'Cosmetics',
      image: 'assets/categories/cosmetics.png',
    ),
  ];
}
