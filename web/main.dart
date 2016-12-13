// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'package:route/client.dart';
import 'package:logging/logging.dart';
import 'urls.dart' as urls;
HttpRequest request;
void main(){
  querySelector("#btnPRLB").onClick.listen(click);
  new Router()
    ..addHandler(urls.sign, showSign)//注册界面
    ..addHandler(urls.main, showMain)//主界面
    ..addHandler(urls.learn, showLearn)//教学主界面
    ..addHandler(urls.teach, showTeach)//学习主界面
    ..addHandler(urls.picture, showPicture)//图文教学界面
    ..addHandler(urls.video, showVideo)//视频教学界面
    ..addHandler(urls.practice, showPractice)//训练主界面
    ..addHandler(urls.mread, showMread)//读报主界面
    ..addHandler(urls.sread, showSread)//单字符读报界面
    ..addHandler(urls.meread, showMeread)//短语读报界面
    ..addHandler(urls.mwrite, showMwrite)//抄报主界面
    ..addHandler(urls.swrite, showSwrite)//单字符抄报界面
    ..addHandler(urls.mewrite, showMewrite)//短语抄报界面
    ..addHandler(urls.merror, showMerror)//错题主界面
    ..addHandler(urls.rerror, showRerror)//读报错题界面
    ..addHandler(urls.werror, showWerror)//抄报错题界面
    ..addHandler(urls.end, showEnd)//结束界面
    ..addHandler(urls.index, (_) => null)//登录界面
    ..listen();
}
void click(MouseEvent e) {
  String url = 'http://localhost:8080/quest';
  request = new HttpRequest();
  request.onReadyStateChange.listen(onData);
  request.open('GET', url);
  request.send();

}

void onData(_) {
  if (request.readyState == HttpRequest.DONE && request.status == 200){
    Map questData = JSON.decode(request.responseText);
    var WordData = questData["Word1"];
    querySelector("#QUES").text =WordData;
  }}

