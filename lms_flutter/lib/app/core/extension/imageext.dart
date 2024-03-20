extension ImageExt on String {
  String get toPng => "assets/images/$this.png";
  String get toJpeg => "assets/images/$this.jpeg";
  String get toJpg => "assets/images/$this.jpg";
}
