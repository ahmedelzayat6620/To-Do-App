// ignore_for_file: public_member_api_docs, sort_constructors_first
//generic class

// class UserToken<T>{
//   T token;
//   UserToken({
//     required this.token,
//   });
// }

// void main(){
//   UserToken<String> user = UserToken(token: "20");
//   UserToken<int> user1 = UserToken(token: 2);
//   UserToken<double> user2 = UserToken(token: 1.5);
//   UserToken<dynamic> user3 = UserToken(token: "20");
//   print(user.token.runtimeType);
// }

// sealed class State {

// }

// class Lodingstate extends State{}
// class SuccessState extends State{}
// class ErrorState extends State{}

// State getState(){
//   return Lodingstate();
// }

// void main(){
// final res = getState();
// switch(res){

//   case Lodingstate():
//   case SuccessState():
//   case ErrorState():
// }
// }

sealed class ResFirbase<T> {}

class SuccessFB<T> extends ResFirbase<T> {
  SuccessFB({this.data});
  T? data;
}
class ErrorFB<T> extends ResFirbase<T> {
  ErrorFB(this.messageEroor);
  String messageEroor;
}
