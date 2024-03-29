class ImageConstants {
  ImageConstants._internal();
  static final ImageConstants _instance = ImageConstants._internal();
  static ImageConstants get instance => _instance;

  String get hotDog => toPng('hotdogs');
  String get projeIcon => toPng('cirlce_hwa');

  String toPng(String name) => 'asset/image/$name.png';
}
