class FavouritesModel {

  List<String> favourites = [];


  FavouritesModel({

    this.favourites,



  });

  FavouritesModel.fromJson(Map<String, dynamic> json)
  {
    json['favourites'].forEach((element) {
      favourites.add((element));
    });


  }
}