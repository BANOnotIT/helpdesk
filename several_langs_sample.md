

# Java 
```Java
import java.io.*;
import java.nio.file.*;

public class WriteFile {

    public static void main(String[] args) {
        System.out.println("Hello world");
        Scanner in = new Scanner(System.in);
        
        // считать сообщение
        String userMessage = in.nextString();
        
        try {
            // открыть файл
            PrintWriter out = new PrintWriter("/tmp/ourfile.txt");
            
            // записать туда строку
            out.println(userMessage);
            
            // сохранить файл
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // вывести оповещение о сохранении сообщения
        System.out.println("Сообщение сохранено");
    }
}
```

# Python
```python
print("Hello World")
# считать сообщение
userMessage = input()
# открыть файл
file = open("/tmp/ourfile.txt", "w")
# записать туда строку
file.Write(userMessage)
# сохранить файл
file.close()
# вывести оповещение о сохранении сообщения
print("Сообщение сохранено")
```

# Ruby
```ruby
puts "Hello World" # или "Hello World\n".display
# считать сообщение
userMsg = gets
# открыть файл
file = File.open("/tmp/ourfile.txt", "w")
# записать туда строку
file.puts userMsg
# закрыть файл
file.close
# вывести сообщение о сохранении сообщения
puts "Сообщение сохранено"
```

# Clojure
```clojure
(ns sample.core
    :require [clojure.java.io :as io])

(defn -main [& args]
  (println "Hello World")
  (doto
    (io/writer "/tmp/ouefile.txt")
    (.write (read-line))
    (.close))
  (println "Сообщение сохранено"))
```

# Javascript
В javascript не так просто взять и считать что-то из строки, по этому другой пример

```javascript
var elem = document.getElementById("elem");
var out = document.getElementById("out");
out.innerHTML = out.value
alert("Done")
```

# Go
```go
package main
import (
    "fmt"
    "io/ioutil"
    "bufio"
    "os"
)
func main(){
     fmt.Println("Hello world");
     scanner := bufio.NewReader(os.Stdin)
     userMessage, _ := scanner.ReadString('\n')
     err := ioutil.WriteFile("./ourfile.txt", []byte(userMessage), 777)
     if err != nil {
         panic(err)
     }
     fmt.Println("Сообщение сохранено")
    
}

```
