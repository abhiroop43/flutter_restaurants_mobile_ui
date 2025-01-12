String getTabName(int tabIndex) {
  switch (tabIndex) {
    case 0:
      return 'Home';
    case 1:
      return 'Restaurants Nearby';
    case 2:
      return 'Favorites';
    case 3:
      return 'My Profile';
    default:
      return 'Restaurants';
  }
}
