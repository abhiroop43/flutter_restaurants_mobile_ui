String getTabName(int tabIndex) {
  switch (tabIndex) {
    case 1:
      return 'Home';
    case 2:
      return 'Restaurants Near Me';
    case 3:
      return 'Favorites';
    case 4:
      return 'My Profile';
    // Add more cases as needed
    default:
      return 'Unknown';
  }
}
