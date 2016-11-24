// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:math';
int time1=0;
int time2=0;
int time=0;


void main() {
  var a="MouseClick";
  var s=querySelector("#pid").text=time.toString();
  querySelector('#sample_text_id2')
    ..text =a
    ..onMouseDown.listen(onText1)
    ..onMouseUp.listen(onText2);

}

void onText1(MouseEvent event) {
   time1=event.timeStamp;
  querySelector('#sample_text_id1').text =time1.toString();
}

void onText2(MouseEvent event)
{
   time2=event.timeStamp;
  querySelector('#sample_text_id1').text =(time2-time1).toString();
}

