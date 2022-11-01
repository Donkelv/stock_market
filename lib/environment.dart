enum Flavor { dev, production }

class FlavorValues {
  FlavorValues({required this.accessKey});

  final String accessKey;
  //Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;

  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.production;

  static bool isDevelopment() => _instance!.flavor == Flavor.dev;
}
