// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:convert';
import 'package:route/client.dart';
import 'package:logging/logging.dart';
import 'urls.dart' as urls;


HttpRequest request;
List<int> t1 = new List(5);
List<int> t2 = new List(5);
List<int> T2 = new List(5);
List<String> dataList;
String datalist;
int clicknumber=-1,nowclick=0;
int longt=3500,num=2500,shortt=1500;




void main(){
  querySelector("#btnPRLB").onClick.listen(click1);
  querySelector("#btnCLICK")
    ..onMouseDown.listen(onText1)
    ..onMouseUp.listen(onText2);

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
void click1(MouseEvent e){
  querySelector("#btnCLICK").text="点我测试";
  String url = 'http://localhost:8080';
  request = new HttpRequest();
  request.onReadyStateChange.listen(onData);
  request.open('GET', url);
  request.send(" your jsonndata");
}

void onText1(MouseEvent event) {
  t1[nowclick]=event.timeStamp;
}
void onText2(MouseEvent event) {
  t2[nowclick]=event.timeStamp-t1[nowclick];
  nowclick++;
  if(clicknumber==nowclick-1){
    String value='';
    for(int i=0;i<=clicknumber;i++)
    {
      if(t2[i]<shortt)
        value=value+'1';
      else if( num < t2[i] && t2[i]<longt )
        value=value+'3';
      else
        value=value+'2';
    }
    if(value==datalist)
      querySelector("#btnCLICK").text="you win!";
    else
      querySelector("#btnCLICK").text="you lose!";
  }
}

void onData(_) {
  if (request.readyState == HttpRequest.DONE && request.status == 200) {
    String jsonData=request.responseText;
    List<String> dataList=jsonData.split(" ");
    clicknumber= dataList[1].length-1;
    datalist=dataList[1];
    querySelector("#QUES").text= dataList[0];
  }
}

