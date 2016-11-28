// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
HttpRequest request;
void main(){
  querySelector("#btnCLICK").onClick.listen(click);

}
void click(MouseEvent e){
  String url = 'http://localhost:8081/ok/stu';   //?
  request = new HttpRequest();
  request.onReadyStateChange.listen(onData);
  request.open('POST', url);
  request.send(" your jsonndata");
}
void onData(_) {
  if (request.readyState == HttpRequest.DONE && request.status == 200) {
    querySelector("#showme").text=request.responseText;
  }
}