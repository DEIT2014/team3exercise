# 1. dart语言特性中的循环语句定义和操作方法
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
# 11. 指引你到其他社区社区寻求dart相关问题帮助的解释部分
    可以在dart官网上寻找答案。
    https://dartlang.org
    在language部分有指引你到其他社区社区寻求dart相关问题帮助的解释部分
# 12. 从web storm软件菜单找出webstrom 中dart开发的帮助文档
