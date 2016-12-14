//Copyright (c) 2016, meflyup. All rights reserved. Use of this source code 
 //is governed by a MIT-style license that can be found in the LICENSE file.


 import 'dart:async';
 import 'dart:io';
 import 'dart:convert';
 import 'package:sqljocky/sqljocky.dart';
 import 'package:args/args.dart';
 import 'package:shelf/shelf.dart' as shelf;
 import 'package:shelf/shelf_io.dart' as io;
 import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
 import 'package:shelf_route/shelf_route.dart';
 import 'dart:math';


 /*
 *这个案例显示如何综合使用shelf pipeline，middleware和handle；
 *如何接受和响应从客户端发起的post和get请求
 *如何连接数据库及查询数据；
 *如何转换json数据
 */




 Map<String, String> type = new Map();
 Map<String, String> word= new Map();
 Map<String, String> time = new Map();
 final pool = new ConnectionPool(host: "127.0.0.1",
     port: 3306,
     user: 'mini',
 //用你自己的账号替代
     password: 'webex3',
 //用你自己的密码替代
     db: 'morse_code',
 //用你自己的数据库替代
     max: 5); //与数据库相连


 main(List<String> args) async {
   //可不关注此处代码
   var parser = new ArgParser()
     ..addOption('port', abbr: 'p', defaultsTo: '8080');
   var result = parser.parse(args);
   var port = int.parse(result['port'], onError: (val) {
     //  stdout.writeln('Could not parse port value "$val" into a number.');
     //  exit(1);
   });
 //建立路由
   var myRouter = router();
   //配置cors参数
   Map <String, String> corsHeader = new Map();
   corsHeader["Access-Control-Allow-Origin"] = "*";
   corsHeader["Access-Control-Allow-Methods"] = 'POST,GET,OPTIONS';
   corsHeader['Access-Control-Allow-Headers'] =
   'Origin, X-Requested-With, Content-Type, Accept';


   myRouter.get('/', _echoUserName);
   myRouter.post('/rest', _echoRequest);
   //配置cors参数
   var routerHandler = myRouter.handler;
   //配置shelf中间件和路由handle
   var handler = const shelf.Pipeline()
       .addMiddleware(shelf.logRequests())
       .addMiddleware(
       shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeader))
       .addHandler(routerHandler);


 //启动服务器


   io.serve(handler, '127.0.0.1', port).then((server) {print('Serving at http://${server.address.host}:${server.port}');
   });
 }




 Future<shelf.Response> _echoUserName(shelf.Request request) async {
   //从数据库获取数据
   String t = await getDataFromDb();
   //把这个post过来的数据有返回给客户端
   return new shelf.Response.ok(
       '$t');
 }


 Future<String> getDataFromDb() async {
   var results = await pool.query('select * from duizhao');
   int i = 0;
   results.forEach((row) {
     //列出所有用户
     String index = i.toString();
     word[index] = row.word;
     time[index]= row.time;
     i++;
   });
 var Randomvar= new Random();
 int n=Randomvar.nextInt(12);
   String jsonData=word['$n']+" "+ time['$n'];
  //String jsonData = JSON.encode(word['$n'] +" "+ time['$n']);
   return jsonData;
 }


 Future<shelf.Response> _echoRequest(shelf.Request request) async {
   //接受post过来的数据
   String content = await request.readAsString();
  //把这个post过来的数据有返回给客户端
   return new shelf.Response.ok(
       'server susscefullly get the post data from client is: "${content}');
 }
