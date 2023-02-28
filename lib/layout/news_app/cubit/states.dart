abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLodingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErorrState extends NewsStates{
  final String error;

  NewsGetBusinessErorrState(this.error);
}


class NewsGetSportLodingState extends NewsStates{}
class NewsGetSportSuccessState extends NewsStates{}
class NewsGetSportErorrState extends NewsStates{
  final String error;

  NewsGetSportErorrState(this.error);
}


class NewsGetScienceLodingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErorrState extends NewsStates{
  final String error;

  NewsGetScienceErorrState(this.error);
}



class NewsGetSearchLodingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErorrState extends NewsStates{
  final String error;

  NewsGetSearchErorrState(this.error);
}
