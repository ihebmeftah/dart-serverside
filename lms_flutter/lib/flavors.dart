enum Flavor {
  player,
  admin,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.player:
        return 'Quiz-player';
      case Flavor.admin:
        return 'Quiz-admin';
      default:
        return 'title';
    }
  }

}
