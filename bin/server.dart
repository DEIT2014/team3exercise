import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:sqljocky/sqljocky.dart';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import 'package:shelf_route/shelf_route.dart';

Map<String, String> data = new Map();
final pool = new ConnectionPool(host: "localhost",
    port: 3306,
    user: 'mini',
//用你自己的账号替代
    password: 'webex3',
//用你自己的密码替代
    db: 'morse_code',
//用你自己的数据库替代
    max: 5); //与数据库相连


main(List<String> args) async {
//建立路由
  int port = 8080;
  var myRouter = router();
  myRouter.get('/quest', getquest);
  //配置cors参数
  Map <String, String> corsHeader = new Map();
  corsHeader["Access-Control-Allow-Origin"] = "*";
  corsHeader["Access-Control-Allow-Methods"] = 'POST,GET,OPTIONS';
  corsHeader['Access-Control-Allow-Headers'] =
  'Origin, X-Requested-With, Content-Type, Accept';
  var routerHandler = myRouter.handler;
  //配置shelf中间件和路由handle
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware(
      shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeader))
      .addHandler(routerHandler);

//启动服务器
  io.serve(handler, '127.0.0.1', port).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

Future<String> getDataFromDb() async {
  var results = await pool.query('select word from duizhao');
  int i = 0;
  results.forEach((row) {
    //列出所有用户名
    String index = "Word" + i.toString();
    data[index] = row.word;
    i++;
  });
  String JsonData = JSON.encode(data);
  return JsonData;
}

Future<shelf.Response> getquest(shelf.Request request) async {
  //从数据库获取数据
  String questAsJson = await getDataFromDb();
  return new shelf.Response.ok(
      '${questAsJson}');
}


/*
void mai(){
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
*/