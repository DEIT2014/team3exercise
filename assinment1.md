# 1. dart语言特性中的循环语句定义和操作方法
    Dart 中控制语句和其它语言类似，支持 if else、条件表达式，switch，for 和 while 循环等。
    while和do while循环与javascript中一样，break,continue中也一样。If else 语句与C语言一样。 
   
    1.// 集合对象可以使用 forEach 方法遍历其中的对象
        forEach((x) => print(x));

    2.// for in 循环 
        var list = [1, 2, 3]; for(var x in list) {   print(x); }
   
    3.//switch 语句 Dart 语言中 switch 语句要求比较的对象只能是num、String 或常量对象，并且一个 switch语句中只能使用相
    同的类型。每个 case语句要么是空的，要么是以 break、continue、return 或 throw结尾。否则如果执行了一个没有以 break、
     continue、return 或 throw 结尾的非空的case 语句时，会出现一个fall-through 错误。default 语句在没有匹配的情况下才
     执行。

    4.switch 语句例子：  
    var x = 1; switch(x) {   case 1:
       print(1); 
       break; // 如果没有 break 语句运行时就会报错   case 2:
       print(2);
       break;   case 3: //允许空的 case，这里如果匹配了 3，就会执行后面的语句，
       并在遇到的第一个 break 时退出  case 4:
       print(4);
       break;   case 5:
       print(5);
       continue L7; // 跳过 case 6，继续执行 case 7 的语句   case 6:
       print(6);
       break; L7:   case 7:
       print(7);
       break;   default:
       print('unknow'); }

# 2. dart字符串的定义和操作方法
    1.String name = 'Bob';或者final String name = 'Bob' ;
    2.字符串是不可变对象，也就是说它的值一旦创建就不会再变，在定义时 可用双引号或单引号
    3.要使用可变字符串，可以使用StringBuffer对象，类似于java中的 StringBuffer类，
      它的值是可变的，使用该对象的toString方法可以生成字符串。 例如:
   ```dart
     var sb = new StringBuffer();  
     sb.add("Use a StringBuffer");  
     sb.addAll(["for ", "efficient ", "string ", "creation "]);  
     sb.add("if you are ").add("building lots of strings.");  
     var fullString = sb.toString();  
     print(fullString);  //   Use a StringBuffer for efficient string creation  
                        //    if you are building lots of strings.  
     sb.clear();
   ```
      4. 可以用加号将字符串连起来,例如：    
      
   ```dart
      var s2 = 'The + operator '+ 'works, as well.';
      assert(s2 == 'The + operator works, as well.');
   ```
      5.  可以创建多行字符串（用三引号）

   
# 3. dart函数定义和使用方法

# 4. dart中数组定义和使用方法
    1.在Dart中数组也叫列表list.

    2.定义一个数组：var list = [1,2,3];

    3.操作数组：
        print(list.length); // the # of elements: 3
        print(list[1]); // the second item: 2  
	    给数组添加元素：list.add(4); 
        从数组中删除一定范围内的元素：
            list.removeRange(2, 1); // remove the third element
        创建固定长度的数组：
            var list = new List(3); //fixed-size list (full of null values) 

# 5.dart中列表定义和使用方法
### 在Dart中数组也叫列表list。
    1. 数组的定义：var list = [1,2,3]; 
    2. 数组的操作：
      1.数组的定义：
      
   ```dart
      var list = [1,2,3];  
      print(list.length); // the # of elements: 3  
      print(list[1]);     // the second item: 2 
  ```
      2.添加元素：
      
  ```dart
         var list = [1,2,3];  
         list.add(4);
  ```
      3.删除元素：
      
  ```dart
         var list = [1,2,3,4];  
         list.removeRange(2, 1); // remove the third element 
  ```   
    
     4.创建固定长度的数组（不能用add（）、removerange（）改变大小）：
  ```dart
         var list = new List(3); //fixed-size list (full of null values);
  ```
      5.遍历数组：
  ```dart
           var list = [1,2,3];  
           for (var x = 0; x < list.length; x++) {  
           print('$x: ${list[x]}');  
           } 
   ```
   ```dart
           for...in:
           var list = [1,2,3];  
           for (final x in list) {  
           print(x);  
           }
   ```
   ```dart
           forEach():
           var list = [1,2,3] 
           void printElement(element) => print(element);  
           list.forEach(printElement);  
   ```
    
# 6.dart中 Map定义和使用方法
# 7. querySelector（）函数的详细API解释
 ```dart
 例子代码：
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
    </head>
    <body>
        <div class="box"></div>     
 
        <div class="box">
            <p id="lost"></p>       
            <p name="qttc"></p>     
        </div>        
 
        <div></div>
 
        <div></div>
 
        <div class="box"></div>     
    </body>
</html>
querySelectorAll与querySelector的区别是querySelectorAll找出所有匹配的节点并返回数组，querySelector找到一个后就返回节点对象。
1.找出所有标签 document.querySelectorAll("*")
2．找出head下所有的标签 document.head.querySelectorAll("*")（FireFox下居然自动多出一个style标签）
3. 找出body标签下的第一个div标签document.body.querySelectorAll("div")[0]  document.body.querySelector("div")
4.找出所有class=box的标签 document.querySelectorAll(".box")
5. 找出所有class=box的div标签 document.querySelectorAll("div.box")
6.找出所有id=lost的标签 document.querySelectorAll("#lost")
7.找出所有p标签并且id=lost的标签 document.querySelectorAll("p#lost")
8.找出所有name=qttc的标签 document.querySelectorAll("*[name=qttc]")
9. 找出所有存在name属性的标签 document.querySelectorAll("*[name]")
10.找出所有class=hot并且存在name属性的p标签
document.querySelectorAll("p.hot[name]")
document.querySelectorAll("p[class=hot][name]")

 ```

# 8. 详细解释dart如何操作html的文档
    1.首先要创建一个dart应用
    2. 然后编辑HTML文件。 双击 index.html 打开该文件。可以看到里面会有如下内容(编辑结束后保存文档)：
 ```dart
    <script defer type="application/dart" src="main.dart"></script>//将dart引入到html中
    <script defer src="packages/browser/dart.js"></script>
 ```
    3. 编辑 Dart 源代码,打开 main.dart 文件并修改 为如下代码：
 ```dart
    import 'dart:html';//导入库
    void main() {
    querySelector('#test').text = 'Wake up, sleepy head!';
    }
  ```
    import 命令导入了一个特别的库， 这样程序就可以使用这个库中的所有类和函数了。 使用 querySelector() 函数，
    将id=”test”的text属性修改为'Wake up, sleepy head!'; 保存文档。
    4. 运行，点击运行按钮，在浏览器中运行。
    
# 9. dart web app 应用程序组织结构的解释部分
# 10. dart可用的各种工具的解释部分
编程语言并不是孤立存在的，Dart也是这样，他由语言规范、虚拟机、类库和工具等组成：

    SDK：SDK 包含 Dart VM、dart2js、Pub、库和工具。 
    Dartium：内嵌 Dart VM 的 Chromium，可以在浏览器中直接执行 dart 代码。 
    Dart2js：将 Dart 代码编译为 JavaScript 的工具。 
    Dart Editor：基于 Eclipse 的全功能 IDE，并包含以上所有工具。支持代码补全、代码导航、快速修正、重构、调试等功能。

# 11. 指引你到其他社区社区寻求dart相关问题帮助的解释部分
    可以在dart官网上寻找答案。
    https://dartlang.org
    在language部分有指引你到其他社区社区寻求dart相关问题帮助的解释部分
# 12. 从web storm软件菜单找出webstrom 中dart开发的帮助文档
