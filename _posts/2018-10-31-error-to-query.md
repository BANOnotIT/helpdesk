---
category: мануалы
title: Как узнать, в чём ошибка?
---

# Алгоритм
1. Скопировать ошибку в текстовый редактор
2. Удалить из текста всё, что Вы написали руками (`my_arr[2]`, `MyAuthClass.auth()`)
3. Удалить из текста местоположение ошибки (например `C:\\User\\Proger\\script.js:15:14`, `/home/developer/script.py:16:2`, `/tmp/java_qi3hyv/SomeClass.java`)
4. Добавить название языка (`python`, `js`, `java`)
5. Добавить слово `error`, если его нет
5. Сделать запрос в поисковике
6. **Если ответа не нашлось**, добавьте в запрос по одному библиотеки и фреймворки, которые используете (`django`, `android`, `jquery`)

# Примеры

## Python
*
```
Traceback (most recent call last):
  File "manage.py", line 8, in <module>
    from django.core.management import execute_from_command_line
ImportError: No module named django.core.management
```
Превращается в:
```
ImportError: No module named django.core.management  python3
```
*
```
Traceback (most recent call last)
<ipython-input-1-e273e7a7bddc> in <module>()
----> 1 123 / 0

ZeroDivisionError: division by zero
```
Превращается в:
```
ZeroDivisionError: division by zero  python3
```
## Javascript
* 
```
Uncaught (in promise) TypeError: https://gitlab.com is not a valid MatchPattern
    at matchPatternToRegExp (global.js:48)
    at siteMatch (global.js:91)
    at browser.runtime.sendMessage.then (keepassxc-browser.js:1444)
```
Превращается в:
```
TypeError: * is not a valid MatchPattern  js|es
```

* 
```
Uncaught ReferenceError: itemf is not defined
    at h.state.items.map.item (<anonymous>:35:28)
    at Array.map (<anonymous>)
    at TodoApp.render (<anonymous>:26:26)
    at renderComponent (unpkg.com/preact@8.3.1/dist/preact.js:269)
    at setComponentProps (unpkg.com/preact@8.3.1/dist/preact.js:246)
    at buildComponentFromVNode (unpkg.com/preact@8.3.1/dist/preact.js:337)
    at idiff (unpkg.com/preact@8.3.1/dist/preact.js:132)
    at diff (unpkg.com/preact@8.3.1/dist/preact.js:107)
    at render (unpkg.com/preact@8.3.1/dist/preact.js:370)
    at <anonymous>:46:1
```
Превращается в:
```
ReferenceError: * is not defined  js|es
```

## Java
*
```
/tmp/java_qi3hyv/OtherClass.java:21: error: cannot find symbol 
return message; 
^ 
symbol: variable message 
location: class OtherClass 
```
Превращается в:
```
error: cannot find symbol  java
```
*
```
Exception in thread "main" java.lang.ArithmeticException: / by zero
at Demo.main(Main.java:12)
```
Превращается в:
```
ArithmeticException: / by zero  java
```
## C#
*
```
Compilation error (line 7, col 3): The name 'msg' does not exist in the current context 
```
Превращается в:
```
The name * does not exist in the current context  cs|c#|csharp  error
```
## C++
*
```
*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)
```
Превращается в:
```
stack smashing detected  c|c++|cpp
```
