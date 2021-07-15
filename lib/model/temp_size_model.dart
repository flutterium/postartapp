class TempSizeModel {
  String title;
  double height;
  double width;

  TempSizeModel({
    required this.title,
    required this.height,
    required this.width,
  });

  static List<TempSizeModel> getTempSizes() {
    return <TempSizeModel>[
      TempSizeModel(
        title: '1080 x 1080     Klasik',
        height: 1080,
        width: 1080,
      ),
      TempSizeModel(
        title: '1080 x 1320     Yeni',
        height: 1320,
        width: 1080,
      ),
    ];
  }
}
