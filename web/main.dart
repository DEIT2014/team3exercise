// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
//<div id="btnCLICK"></div>34-35hangzhijian
import "dart:html";
import 'dart:math';



HttpRequest request1,request2;
List<int> t1 = new List(5);
List<int> t2 = new List(5);
List<int> T2 = new List(5);
List<String> dataList;
String datalist,wordy,corr,cho='letter';
int clicknumber=-1,nowclick=0;
int longt=3500,num=2500,shortt=1500;


void main(){
  querySelector("#btnPRSANe").onClick.listen(click1);
  querySelector("#btnPRSANe2").onClick.listen(click2);
  querySelector("#btnclick1")
    ..onMouseDown.listen(onText1)
    ..onMouseUp.listen(onText2);
  querySelector("#btnclick2")
    ..onMouseDown.listen(onText1)
    ..onMouseUp.listen(onText2);


}


void click1(MouseEvent e){
  cho='letter';
  querySelector("#btnclick1").text="click me";
  String url = 'http://localhost:8080/quest1';
  request1 = new HttpRequest();
  request1.onReadyStateChange.listen(onData);
  request1.open('GET', url);
  request1.send(cho);

}

void click2(MouseEvent e){
  cho='number';
  querySelector("#btnclick2").text="click me";
  String url = 'http://localhost:8080/quest2';
  request1 = new HttpRequest();
  request1.onReadyStateChange.listen(onDatab);
  request1.open('GET', url);
  request1.send(cho);
}

void onText1(MouseEvent event) {
  t1[nowclick]=event.timeStamp;
}
void onText2(MouseEvent event) {
  t2[nowclick]=event.timeStamp-t1[nowclick];
  nowclick++;
  if(clicknumber==nowclick-1){
    String value='';
    nowclick=0;
    for(int i=0;i<=clicknumber;i++)
    {
      if(t2[i]<shortt)
        value=value+'1';
      else if( num < t2[i] && t2[i]<longt )
        value=value+'3';
      else
        value=value+'2';
    }
    if(value==datalist){
      corr= wordy + " "+ 'T';
      changevalue();
      querySelector("#btnclick1").text="you win!";
      querySelector("#btnclick2").text="you win!";
    }

    else
    {corr=wordy + " "+ 'F';
    changevalue();
    querySelector("#btnclick1").text="you lose!";
    querySelector("#btnclick2").text="you lose!";}
    clicknumber=-1;

  }
}

void onData(_) {
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
    String jsonData=request1.responseText;
    List<String> dataList=jsonData.split(" ");
    clicknumber= dataList[1].length-1;
    datalist=dataList[1];
    wordy=dataList[0];
    querySelector("#labPRSAR").text= dataList[0];
  }
}
void onDatab(_) {
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
    String jsonData=request1.responseText;
    List<String> dataList=jsonData.split(" ");
    clicknumber= dataList[1].length-1;
    datalist=dataList[1];
    wordy=dataList[0];
    querySelector("#labPWSAR").text= dataList[0];
  }
}
void changevalue()
{String url = 'http://localhost:8080/geterr';
request2 = new HttpRequest();
request2.onReadyStateChange.listen(onData2);
request2.open('POST', url);
request2.send(corr);}


void onData2(_)
{}