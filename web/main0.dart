import "dart:html";
import 'dart:math';
HttpRequest request1,request2;
int clicknumber=-1,nowclick=0;
List<String> dataList;
    String wordy,datalist;
void main(){
getdata1();
}

void getdata1()
{  String url = 'http://localhost:8080/posterr';
request1 = new HttpRequest();
request1.onReadyStateChange.listen(onData1);
request1.onReadyStateChange.listen(onData2);
request1.open('GET', url);
request1.send("data");}



void onData1(_){
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
  String jsonData1=request1.responseText;
  querySelector("#wordw").text= "1. 31111  2. 1313  3. 1113  4. 1313 ";
}
}
void onData2(_){
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
    String jsonData2=request1.responseText;
    querySelector("#wordr").text= jsonData2;
  }
}