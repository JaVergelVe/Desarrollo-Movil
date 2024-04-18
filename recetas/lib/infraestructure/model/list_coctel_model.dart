class ListCoctelModel {
  String idDrink;
  String strDrink;
  String strDrinkThumb;

  ListCoctelModel(
      {required this.idDrink,
      required this.strDrink,
      required this.strDrinkThumb});

  factory ListCoctelModel.fromJsonMap(Map<dynamic, dynamic> json) =>
      ListCoctelModel(
          idDrink: json["idDrink"],
          strDrink: json["strDrink"],
          strDrinkThumb: json["strDrinkThumb"]);
}
