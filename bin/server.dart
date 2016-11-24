import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main() {
  var myRouter = router()
    ..get('/userinfo',responseUser)
    //登录
    ..post ('/signup',postUser)
    ..get('/question/twelvetype',responsequestion)
     //获取题目
    ..get('/geterr',responseerr)
     //获取错题
    ..post('/posterr',posterr);
     //发送错题
  io.serve(myRouter.handler,'localhost',8080);
}

responsequestion(request){
  //todo 访问题目列表，获取练习题
}

responseerr(request){
  //todo 访问错题列表，获取错题
}
posterr(request) {
  //todo 发送错题至错题列表
}
responseUser(request){
  //todo 登录时获取用户信息
}
postUser(resquest){
  //todo 注册时发送用户信息
}
