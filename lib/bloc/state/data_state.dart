


abstract class DataState<T> {
  T? data;
  String? message;

  @override
  String toString() {
    return '${runtimeType} => {message: $message, data: ${data.toString()}';
  }
}

class AppBottomNavBarState extends DataState{}
class InitialState extends DataState{}
class BottomNavState extends DataState{}

class DataStateEmpty<T> extends DataState<T>{}
class DataStateLoading<T> extends DataState<T>{}
class DataStateSuccess<T> extends DataState<T>{
  DataStateSuccess({T? data}){
    this.data = data;
  }
}

class DataStateError<T> extends DataState<T>{
  DataStateError({String? message}){
    this.message = message;
  }
}
