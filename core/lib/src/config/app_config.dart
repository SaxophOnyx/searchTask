enum Flavor {
  prod,
}

class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl;
    switch (flavor) {
      case Flavor.prod:
        baseUrl = 'https://openlibrary.org/';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
    );
  }
}
