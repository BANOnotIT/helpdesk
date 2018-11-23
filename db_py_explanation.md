[//]: # (зачем нужен файл, что в нем происходит)

[//]: # (как в питоне импортируются файлы)
```python
from enum import Enum, unique
```

```python
from peewee import Model, IntegerField, PostgresqlDatabase, TextField, CompositeKey
```

```python
from urllib3.util import parse_url
```
```python
from config import * 
```
[//]: # (напомнить как в питоне импортируются компоненты из файла и откуда возьмется db_url)

[//]: # (объявление функций в питоне)

[//]: # (напоминание ООП, чтобы пояснить класс PostgresqlDatabase (подробнее об ООП и его истории - туть .. ссыль))


```python
def get_database():
    parsed_url = parse_url(db_url)

    # Берём из auth имя пользователя и пароль от БД
    username, password = parsed_url.auth.split(':')

    return PostgresqlDatabase(
        parsed_url.path[1:],  # Пропускаем первый "/", так как он не является названием БД
        host=parsed_url.host,
        user=username,
        password=password
    )
```
[//]: # (что такое parse_url (доки) и во что она превратит строку для примера)
[//]: # (структура полученного parsed_url и что мы из него берем)

database = get_database()
[//]: # (напоминание сохранения в переменной экземпляра класса базы данных, сказать, что внутри подключение)

[//]: # (пояснить синтаксис объявления класса в питоне и наследования)
```python
@unique # что такое декоратор и что делает unique: unique() Enum class decorator that ensures only one name is bound to any one value.
class EUserState(Enum): # Enum - Base class for creating enumerated constants. тип данных, чьё множество значений представляет собой ограниченный список идентификаторов.
    initial = 0
    authorizing = 1
    base = 2
    integrating_tg = 3
    integrating_vk = 4
    trading = 5

    @classmethod # https://www.programiz.com/python-programming/methods/built-in/classmethod
    def as_choices(cls):
        return [(item[1].value, item[0]) for item in cls.__members__.items()] # https://habr.com/post/186608/
```


[//]: # (привести картинку нашей таблички, провести соответствие между типом данных и классом ORM)
``` python
class User(Model):
    tg = IntegerField(default=0, help_text='Telegram User Id')
    vk = IntegerField(default=0, help_text='VK User Id')
    state = IntegerField(default=EUserState.initial.value, choices=EUserState.as_choices(),
                         help_text='Current bot state for user')
    state_param = TextField(default='', help_text='Param for state')

    def set_state(self, state: EUserState, param=''): # self
        self.state = state.value
        self.state_param = param

    def __repr__(self):
        return '<User tg={} vk={} state={}:{}>'.format(self.tg, self.vk, EUserState(self.state).name,
                                                       self.state_param) # .format в python, а так же __repr__ доки

    class Meta: # пояснить зачем
        database = database
        table_name = 'app_users'
        primary_key = CompositeKey('tg', 'vk') # пояснить что это


def create_tables():
    with database: # Для чего применяется конструкция with ... as? Для гарантии того, что критические функции выполнятся в любом случае. Самый распространённый пример использования этой конструкции - открытие файлов.  https://pythonworld.ru/osnovy/with-as-menedzhery-konteksta.html
        database.create_tables([User])
    # закрываем подключение, чтобы не могли слушать ничего страшного.
    database.close() # пояснить как это работает и зачем делают
```