// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';


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


