// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
HttpRequest request;
void main(){
  querySelector("#btnPRLB").onClick.listen(click);

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
  }
}