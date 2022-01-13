abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class BottomNavState extends NewsStates{}
class AppMode extends NewsStates{}
class NewsGetBusinessSuccessData extends NewsStates{}
class NewsGetBusinessErrorData extends NewsStates{
  late final String error;
  NewsGetBusinessErrorData(String error);
}
class NewsGetSportsSuccessData extends NewsStates{}
class NewsGetSportsErrorData extends NewsStates{
 late final String error;
 NewsGetSportsErrorData(String error);
}
class NewsGetScienceSuccessData extends NewsStates{}
class NewsGetScienceErrorData extends NewsStates{
  late final String error;
  NewsGetScienceErrorData(String error);
}

class NewsSearchLoading extends NewsStates{}
class NewsSearchSuccess extends NewsStates{}
class NewsSearchError extends NewsStates{
  late final String error;
  NewsSearchError(String error);
}