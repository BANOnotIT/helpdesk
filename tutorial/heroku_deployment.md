# Heroku - облачная платформа для хостинга приложений
Heroku - удобная платформа для разворачивания "правильных" приложений. Что такое облачная платформа и что такое "правильные" приложения - далее.

## Что такое облачная платформа. Как это работает?
И так. Начнём с того, что такое облако. Облако - большое количество серверов, которыми занимается кто-то другой. Вам же на этих серверах можно делать что-то, что хотите сами, но по строгим правилам лицензирования. Например если владелец серверов не хочет иметь проблем с ФСБ, он может просто не разрешать использовать свои сервера для создания проксей Телеграма или какого-ниудь Tor. Но это уже политика...

Чем же это удобно для нас? Тем что нам не нужно руками трогать сервер и понимать как и какие провода соединять чтобы оно работало. Мы можем просто заказать процессоры определённой мощьности или время работы на этих процессорах или диски определённого объёма. Нам не нужно ничего самим трогать и думать о физической составляющей - этим занимается хостер. Даже больше того, вы можете сказать: "Мне сегодня понадобятся 300 серверов, потому что сегодня будет праздник", и хостер в автоматическом режиме просто отдаст вам 300 серверов.

### Чем это отличается от VDS?
Ну в основном тем, что все облачные сервисы принимают только "правильные" приложения, иначае просто не заработает. "Правильные" приложение - которые можно запускать в автоматическом режиме без участия человека. Это нужно как раз для того, чтобы хостер мог без особых трудностей развернуть для вас 300 серверов за 10 секунд и точно так же за 2 секунды без лишних проблем отдать эти сервера другому человеку, если они ему будут нужнее.

Каждый сервис предлагает свои способы организации "правильных" приложений:
- [Firebase](https://firebase.google.com/) - Платформа, которая даёт свой времворк для взаимодействия. Если вы знаете что такое VM или какой-нибудь Node.js, то по сути вы просто пишите код для этой платформы и он просто вызывается тогда, когда это надо, без лишних прогреваний или запуска виртуального сервера. _Оплата по количеству запросов_.
- [Amazon Web Services](https://aws.amazon.com/ru/) - Вы создаёте своё приложение каким хотите, разделяете его на небольшие кусочки (ноды) и отдаёте это всё Амазону. Он сам знает когда и сколько чего развернуть. _Оплата по времени работы и объёму*время хранения данных в хранилищах_.
- [Heroku](https://heroku.com) - Обёртка над AWS. Вы создаёте приложение на любимом языке (Node.js, Ruby, PHP, Python) и рассказываете в небольшом файле Procfile как именно ваше приложение можно запустить. Вся остальная рутина по объяснению AWS как всё запускать остаётся на серверах самого Heroku. _Оплата по времени работы_.

## Почему Heroku?
И так какие есть плюсы вот какие плюсы есть у Heroku:
1. Бесплатно: 570 часов работы каждый месяц (19 часов/день), 10k строчек в БД (Postgree) и Redis - достаточно неплохо для школьного проекта
2. Переносимость на свой сервер при необходимости - в отличии от Firebase вам не нужно будет из кода выпиливать половину специальных конструкций. В отличии от AWS, все необходимые вещи для запуска приложение вы вполоне сможете выполнить и руками на своём собственном сервере, ведь "правильное" приложение уже сделано.
3. При регистрации не нужно никаких кредитных карточек.

Для какого рода приложений хорошо:
- Веб сайт или блог
- Боты
- Панелька какая-нибудь администраторская
- Чатик

Для него неоч:
- Бекэнд для мобильных приложений - тут лучше посмотреть в сторону [Firebase](https://firebase.google.com/), там для мобильных приложений очень много интересных плюшек предусмотрено.
- Сервер для чего-то, что должно работать 24/7 - вам может не хватить бесплатного пакета услуг...

## Немного подробнее
И так, как же работает Heroku. В отличии от AWS, ваше приложение не работает всё время, оно включается тогда, когда к нему пришёл какой-то запрос и работает после этого ещё 30 минут, вдруг ещё придёт. 

Плюсы такого подхода - экономия времени работы для хостера, плюсы для нас - можно растянуть удовольствие чуть дольше) 

Минусы - приложение запускается на самом деле не очень быстро, так что может возникунть проблема того, что пользователь будет минутку другую ждать пока ему придёт ответ от нашего сервера, но зато остальное время будет достаточно шустро раотать. Это называется разогревом. Для разного рода ботов проблема не большая - сервера телеги или вк всегда пришлют ещё один запросик, чтобы уж точно дошёл. А вот для системы слежения за хомячками - уже больше проблем.

Так же платформа имеет "пресеты" для разных языков (Node.js, Python, Ruby, PHP, Java, Closure, Scala, Go). Это всё из **бесплатных** пресетов, так же вы можете "докупить" пресет под что-то относительно экзотическое, например MySQL базу данных или RabbitMQ очередь для своего проекта. Ну или, например, C++ среду для какой-то своей очень очень ресурсоёмкой задачи.

Но для нас вполне хватит Python + Postgree + Redis, остальное в проектах ШИР не встречается)

Так же платформа позволяет [выполнять какие-то команды по расписанию](https://devcenter.heroku.com/articles/scheduler). Вещь работает достаточно стабильно, хотя сами **разработчики предупреждают**, что иногда может давать осечки... Работает она так же как и простое приложение - как только запустилось, **начались вычитываться месячные часы работы**, как только закончило что-то выполнять - всё, списываться ничего не будет.

Ещё можно запускать worker процессы - которые будут работать постоянно. Но эти процессы **будут так же есть часы в месяц**, которые можно было использовать для работы основного приложения. Поэтому эта фича просто достойна упоминаний. 

Все необходимые настройки приложению передаются через ENV. Это скорее стандарт для всех приложений у больших компаний, так что при разработке приложения сразу советую все необходимые настройки брать из окуржения.

# Перейдём к развёртыванию!
Для примера возьмём вот такое сферическое приложение в вакууме:
- Наше приложение наприсано на Python
- Мы используем Flask
- Нам нужна БД
- Приложение является блогом
- Все исходники приложения хранятся на GitHub

## Регистрация
Для того, чтобы воспользоваться чем-то, нужно зарегистрироваться.

1. Заходим на [страницу регистрации](https://signup.heroku.com/)
2. Первые 3 поля - обязательные для честного заполнения. Остальное - для статистики внутри хероку. Но компанией вы моежет назвать свою команду, себя представить студентом, а любимый язык выбрать по вкусу.
3. **Не забудьте прочитать Правила!**

## Создание приложения
После регистрации и подтверждения email адреса нас должно впустить в Dashboard. Это панель управления. Тут будут находится все наши приложения.

1. Теперь мы можем нажать на кнопку "New" и выбрать "Create New App"
2. Каким-то образом называем наше приложение. Это нужно потому, что потом наше приложение будет доступно по адресу `https://<appname>.herokuapp.com`, ну и приложение должно иметь какое-то уникальное имя.
3. Страна развёртывания - где будет ваше приложение храниться, в каком датацентре. На самом деле интернет не такой уж и большой, но от нас ближе Европа, так что давайте выберем её.


Нас сразу перекинуло на вкладку "Deploy". Так что продолжим

## Развёртывание
Способов передачи приложения серверам хероку очень много - и ручные, и специальные git репозитории, и Docker образа. Нам всё это не интересно, потому что это всё сложные технологии для бородатых дядек, которые едят на завтрак материнские платы, запивая смуззи из пива.

Мы люди простые, нам хочется чтобы всё делалось автоматом, поэтому мы **привяжем GitHub-репозиторий**!
1. Выбираем вкладку "GitHub"
2. Проходим процесс "привязки" GitHub-аккаунта
3. Находим свой репозиторий с помощью специального поля поиска
4. Нажимаем кнопку "Connect"

Теперь давайте включим автоматическое развёртывание. Для этого в секции **"Automatic deploys"** нажимаем кнопку **"Enable Automatic Deploys"**.

Всё! Теперь когда мы даем какой-то коммит в `master` ветку нашего репозитория хероку автоматически будет забирать все исходники из репозитория и разворачивать приложение.

## Инструкции к разворачиванию
### - А какой язык ты используешь, расскажи?
На самом деле сейчас Heroku не сможет ничего развернуть. Потому что он даже не знает даже как к нашему приложению подойти, может это Ruby приложение, может вообще Java!

Давайте сделаем файл-индикатор. В нашем случае (Python) файлом-индикатором является `requirements.txt`, в котором должны храниться названия и версии всех пакетов, которые необходимы для работы нашего приложения. Создать этот файл очень просто:
```bash
pip3 freeze > requirements.txt
```

На самом деле этот файл должен быть в любом python проекте, так как другой разработчик может не знать всех необходимых версий библиотек, сейчас всё, что ему нужно сделать это выполнить команду:
```bash
pip3 install -f requirements.txt
```
И всё, у него теперь всё на месте и всё должно работать.

### - А как мне теперь всё это запустить?
Теперь хероку знает как к этому делу подступиться, но он не знает как всё же запустить наше приложение. Да и вообще, об этом пока знаем только мы.

Для начала нам нужно установить сервер, который будет запускать наше Flask приложение. На самом деле приложение может быть и на Tornado, и на Django. У них у всех есть возможность использовать такую страшную технологию как uWSGI. А сервером для этой технологии мы выберем `gunicorn`. Ну что же, установим его:
```bash
pip3 install gunicorn  # Устанавливаем локально
pip3 freeze > requirements.txt  # обязательно сохраняем, чтобы Heroku тоже установил этот пакет
```

Ну что же, теперь осталось рассказать как конкретно запускать наш сервер.
1. Создадим файл `Procfile`
```Procfile
web: gunicorn app:flask_app --log-file=- --log-level=debug
```
2. Закомитим и запушим этот файл в GitHub

А теперь немного о том, что же содержится в нашем Procfile?

- `web:` - мы говорим, что эта команда должна запускаться при запросе на сайт https://<appname>.herokuapp.com
- `gunicorn` - собственно запускаем uWSGI сервер
- `app:flask_app` - в python-модуле app в переменной flask_app хранится наше приложение
- `--log-file=-` - все логи нашего приложения выводить сразу в консоль
- `--logl-level=debug` - все логи, которые важнее debug

## А как же БД?
А теперь давайте к нашему приложению подключим базу данных.

1. Зайдём во вкладку "Resources" 
2. Введём там в поле поиска "heroku"
3. Выбираем "Heroku Postgres"
4. Подтверждаем подключение модуля к нашему приложению

Всё, круть! На доступна БД на 10k строк!

Но нам нужно как-то чтобы наше приложение подключилось к ней. Если мы перейдём во вкладку "Settings" и нажмём на кнопочку "Reveal Config Vars", то увидим там строчку
|---|---|
|DATABASE_URL|postgres://asdf:asdf.asdf@asdf.amazonaws.com/adsf|
Эта строчка может меняться. В зависимости от того как захочет Heroku, может через день, может через неделю, а может им понадобится менять её хоть каждые 5 минут. Поэтому нам не важна сама строчка, нам эта строчка нужно внутри приложения.
```python3
from os import getenv

db_url = getenv('DATABASE_URL')
```
Всё! Теперь мы умеем забирать настройки для приложения из переменных окружения.

Теперь мы каким-то магическим образом по этому адресу подключаемся к БД.

# Что же теперь?
А теперь вот вам несколько советов:
1. Все настройки (токены, пароли администраторов, любые данные для входа куда-нибудь) храните в переменных окуржения, теперь вы знаете как их получить, а в рядом с `DATABASE_URL` вполне можете так же сделать свою строчечку со своим именем и значением
2. Поиграйтесь немного с тем, что найдёте в интерфейсе Heroku. Например вы можете полностью удалить все данные в БД, посмтреть логи своего приложения, использовать вместо appname.herokuapp.com свой собственный домен, вручную достать исходники из GitHub или принудительно перезапустить приложение.
3. Не нажимайте на что-то, где не написано "free". Конечно ничего сильно страшного не случится, ведь они сначала потребуют деньги, но отключать потом все эти платные функции - дело не очень приятное.

Так же вы можете почитать документацию на английском, [обратиться к Хелпдеску за помощью](https://itsolschool.slack.com/messages/helpdesk) или [посмотреть на исходники приложения](https://github.com/BANOnotIT/helpdesk-tg-vk-bot), которое уже лежит на Heroku и работает.