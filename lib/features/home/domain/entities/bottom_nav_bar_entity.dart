class BottomNavBarEntity {
  final String activeItem, inactiveItem, name;

  BottomNavBarEntity({
    required this.name,
    required this.activeItem,
    required this.inactiveItem,
  });
}

List<BottomNavBarEntity> getBottomNavBarItems() {
  return [
    BottomNavBarEntity(
      name: 'الرئيسية',
      activeItem: 'assets/images/nav_bar/filled/home.svg',
      inactiveItem: 'assets/images/nav_bar/outlined/home.svg',
    ),
    BottomNavBarEntity(
      name: 'المنتجات',
      activeItem: 'assets/images/nav_bar/filled/products.svg',
      inactiveItem: 'assets/images/nav_bar/outlined/products.svg',
    ),
    BottomNavBarEntity(
      name: 'سلة التسوق',
      activeItem: 'assets/images/nav_bar/filled/shopping-cart.svg',
      inactiveItem: 'assets/images/nav_bar/outlined/shopping-cart.svg',
    ),
    BottomNavBarEntity(
      name: 'حسابي',
      activeItem: 'assets/images/nav_bar/filled/user.svg',
      inactiveItem: 'assets/images/nav_bar/outlined/user.svg',
    ),
  ];
}
