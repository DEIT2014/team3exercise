import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main() {
  var myRouter = router()
    ..get('/userinfo',responseUser)
  //get w.r
    ..get('/w_letter',response_w_letter)
    ..get('/w_figure',response_w_figure)
    ..get('/w_phrase_letter',response_w_phrase_letter)
    ..get('/w_phrase_figure',response_w_phrase_figure)
    ..get('/w_phrase_mixture',response_w_phrase_mixture)
    ..get('/w_sentence',response_w_sentence)
    ..get('/r_letter',response_r_letter)
    ..get('/r_figure',response_r_figure)
    ..get('/r_phrase_letter',response_r_phrase_letter)
    ..get('/r_phrase_figure',response_r_phrase_figure)
    ..get('/r_phrase_mixture',response_r_phrase_mixture)
    ..get('/r_sentence',response_r_sentence)
  //get err
    ..get('/err_w_letter',response_err_w_letter)
    ..get('/err_w_figure',response_err_w_figure)
    ..get('/err_w_phrase_letter',response_err_w_phrase_letter)
    ..get('/err_w_phrase_figure',response_err_w_phrase_figure)
    ..get('/err_w_phrase_mixture',response_err_w_phrase_mixture)
    ..get('/err_w_sentence',response_err_w_sentence)
    ..get('/err_r_letter',response_err_r_letter)
    ..get('/err_r_figure',response_err_r_figure)
    ..get('/err_r_phrase_letter',response_err_r_phrase_letter)
    ..get('/err_r_phrase_figure',response_err_r_phrase_figure)
    ..get('/err_r_phrase_mixture',response_err_r_phrase_mixture)
    ..get('/err_r_sentence',response_err_r_sentence)
  //post
    ..post('/err_w_letter',send_err_w_letter)
    ..post('/err_w_figure',send_err_w_figure)
    ..post('/err_w_phrase_letter',send_err_w_phrase_letter)
    ..post('/err_w_phrase_figure',send_err_w_phrase_figure)
    ..post('/err_w_phrase_mixture',send_err_w_phrase_mixture)
    ..post('/err_w_sentence',send_err_w_sentence)
    ..post('/err_r_letter',send_err_r_letter)
    ..post('/err_r_figure',send_err_r_figure)
    ..post('/err_r_phrase_letter',send_err_r_phrase_letter)
    ..post('/err_r_phrase_figure',send_err_r_phrase_figure)
    ..post('/err_r_phrase_mixture',send_err_r_phrase_mixture)
    ..post('/err_r_sentence',send_err_r_sentence);

  io.serve(myRouter.handler,'localhost',8080);
}
responseUser(request){
  //登录时获取用户信息
}
//w.r
response_w_letter(request){
  //todo 访问字母抄报列表，获取字母抄报练习题
}
response_w_figure(request){
  //todo 访问数字抄报列表，获取数字抄报练习题
}
response_w_phrase_letter(request){
  //todo 访问字母短语抄报列表，获取字母短语抄报练习题
}
response_w_phrase_figure(request){
  //todo 访问数字短语抄报列表，获取数字短语抄报练习题
}
response_w_phrase_mixture(request){
  //todo 访问混合短语抄报列表，获取混合短语抄报练习题
}
response_w_sentence(request){
  //todo 访问长句抄报列表，获取长句抄报练习题
}
response_r_letter(request){
  //todo 访问字母读报列表，获取字母读报练习题
}
response_r_figure(request){
  //todo 访问数字读报列表，获取数字读报练习题
}
response_r_phrase_letter(request){
  //todo 访问字母短语读报列表，获取字母短语读报练习题
}
response_r_phrase_figure(request){
  //todo 访问数字短语读报列表，获取数字短语读报练习题
}
response_r_phrase_mixture(request){
  //todo 访问混合短语读报列表，获取混合短语抄读练习题
}
response_r_sentence(request){
  //todo 访问长句读报列表，获取长句抄读练习题
}
//err
response_err_w_letter(request){
  //todo 访问字母抄报错题列表，获取字母抄报错题
}
response_err_w_figure(request){
  //todo 访问数字抄报错题列表，获取数字抄报错题
}
response_err_w_phrase_letter(request){
  //todo 访问字母短语抄报错题列表，获取字母短语抄报错题
}
response_err_w_phrase_figure(request){
  //todo 访问数字短语抄报错题列表，获取数字短语抄报错题
}
response_err_w_phrase_mixture(request){
  //todo 访问混合短语抄报错题列表，获取混合短语抄报错题
}
response_err_w_sentence(request){
  //todo 访问长句抄报错题列表，获取长句抄报错题
  }
response_err_r_letter(request){
  //todo 访问字母读报错题列表，获取字母读报错题
}
response_err_r_figure(request){
  //todo 访问数字读报错题列表，获取数字读报练错题
}
response_err_r_phrase_letter(request){
  //todo 访问字母短语读报错题列表，获取字母短语读报错题
}
response_err_r_phrase_figure(request){
  //todo 访问数字短语读报错题列表，获取数字短语读报错题
}
response_err_r_phrase_mixture(request){
  //todo 访问混合短语读报错题列表，获取混合短语抄读错题
}
response_err_r_sentence(request){
  //todo 访问长句读报列表，获取长句抄读练习题
}
//post
send_err_w_letter(request) {
  //todo 发送字母抄报错题至字母抄报错题列表
}
send_err_w_figure(request){
  //todo 发送数字抄报错题至数字抄报错题列表
}
send_err_w_phrase_letter(request){
  //todo 发送字母短语抄报错题至字母短语抄报错题列表
}
send_err_w_phrase_figure(request){
  //todo 发送数字短语抄报错题至数字短语抄报错题列表
}
send_err_w_phrase_mixture(request){
  //todo 发送混合短语抄报错题至混合短语抄报列表题
}
send_err_w_sentence(request){
  //todo 发送长句抄报错题至长句抄报列表题
}
send_err_r_letter(request){
  //todo 发送字母读报错题至字母读报错题列表
}
send_err_r_figure(request){
  //todo 发送数字读报错题至数字读报错题列表
}
send_err_r_phrase_letter(request){
  //todo 发送字母短语读报错题至字母短语读报错题列表
}
send_err_r_phrase_figure(request){
  //todo 发送数字短语读报错题至数字短语读报错题列表
}
send_err_r_phrase_mixture(request){
  //todo 发送混合短语读报错题至混合短语读报错题列表
}
send_err_r_sentence(request){
  //todo 发送长句读报错题至长句读报错题列表
}