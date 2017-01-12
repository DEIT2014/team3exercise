import "dart:html";
import 'dart:math';



HttpRequest request1,request2;
InputElement ans;
List<String> dataList;
String datalist,datalist2,wordy,corr,cho='letter';
void main(){
  querySelector("#btnPWSAN").onClick.listen(click);
  querySelector("#btnPWSNN").onClick.listen(click2);
  querySelector("#btnSUBMIT").onClick.listen(click3);

}
void click3(MouseEvent e){
  ans = querySelector("#textPWSA");
  String answ=ans.value;
  if(answ==datalist2)
    querySelector("#btnSUBMIT").text = 'you win!';
  else
    querySelector("#btnSUBMIT").text = 'you lose!';
}

void click(MouseEvent e){
  querySelector("#btnSUBMIT").text = 'submit';
  querySelector("#textPWSN") ;
  cho='letter';
  String url = 'http://localhost:8080/quest1';
  request1 = new HttpRequest();
  request1.onReadyStateChange.listen(onData);
  request1.open('GET', url);
  request1.send(cho);

}
void click2(MouseEvent e){
  querySelector("#btnSUBMIT").text = 'submit';
  String url = 'http://localhost:8080/quest2';
  request1 = new HttpRequest();
  request1.onReadyStateChange.listen(onData2);
  request1.open('GET', url);
  request1.send(cho);

}
void onData(_) {
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
    String jsonData = request1.responseText;
    List<String> dataList = jsonData.split(" ");
    datalist = dataList[1];
    datalist2=dataList[0];
    querySelector("#labPWSAR").text = datalist;
  }
}
void onData2(_) {
  if (request1.readyState == HttpRequest.DONE && request1.status == 200) {
    String jsonData = request1.responseText;
    List<String> dataList = jsonData.split(" ");
    datalist = dataList[1];
    datalist2=dataList[0];
    querySelector("#labPWSNR").text = datalist;

  }
}