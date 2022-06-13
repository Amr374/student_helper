abstract class StudentStates {}
class GetCoursesInitialState extends StudentStates {}

class GetCoursesLoadingState extends StudentStates {}

class GetCoursesSuccessState extends StudentStates {}

class GetCoursesErrorState extends StudentStates
{
  final String error;

  GetCoursesErrorState(this.error);
}
class IsNoCoursesDataSuccessState extends StudentStates {

}


class GetPdfInitialState extends StudentStates {}

class GetPdfLoadingState extends StudentStates {}

class GetPdfSuccessState extends StudentStates {}

class GetPdfErrorState extends StudentStates
{
  final String error;

  GetPdfErrorState(this.error);
}
class IsNoDataSuccessState extends StudentStates {

}

class GetFavoritesInitialState extends StudentStates {}

class GetFavoritesLoadingState extends StudentStates {}

class GetFavoritesSuccessState extends StudentStates {}

class AddFavoritesSuccessState extends StudentStates {}

class AddFavoritesLoadingState extends StudentStates {}

class RemoveFavoritesSuccessState extends StudentStates {}

class GetFavoritesErrorState extends StudentStates
{
  final String error;

  GetFavoritesErrorState(this.error);
}
class IsNoFavoritesDataSuccessState extends StudentStates {

}

