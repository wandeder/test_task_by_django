[![linter](https://github.com/Morozov33/test_task_by_django/actions/workflows/linter.yml/badge.svg)](https://github.com/Morozov33/test_task_by_django/actions/workflows/linter.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/07b5d943839061b39930/maintainability)](https://codeclimate.com/github/Morozov33/test_task_by_django/maintainability)
---
## Конструктор меню  
### *Тестовое задание для компании [UpTrader](https://uptrader.io/en/) на позицию Junior Backend Developer.*  
#### Ссылка на развернутое приложение на Heroku: https://menu-builder-django.herokuapp.com/  
---
Позволяет конструировать выпадающее древовидное меню, используя стандартную панель администратора Django.  
Описание:
1. Войти в панель администратора можно по адресу: https://menu-builder-django.herokuapp.com/admin или по кнопке `Create menu` на домашней странице приложения.
2. В панели администратора в разделе `MENU_BUILDER/Menus` уже созданны два меню: `main_menu` и `docs_menu`.
3. Доступны все CRUD операции для создания новых меню и пунктов, и редактирования существующих.
4. URL пункта меню может быть задан как явным образом `/catalog/category_1/subcategory_1/product_1/` так и через named URL `product_1` (должен быть зарегестрирован в `urlpatterns` файла `urls.py`). Так же допустимы URL сторонних ресурсов: `http://example.com/`.
5. Изменение структуры меню возможно как через изменение параметра `Parent` пунктов меню, так и через простое перетаскивание пунктов меню в панели администратора.
6. Новое меню можно создать через панель администратора, добавив новую запись с `Parent = ------`, это будет root нового меню.
7. Нарисовать меню можно на любой нужной странице, используя `{% draw_menu 'menu_name' %}` в шаблонах Django.
8. Тег `{% draw_menu %}` необходимо загрузить, добавив в начало шаблона строку `{% load common_tags %}`.
9. Функция обработки тега `{% draw_menu %}` находиться в файле `./menu_builder/templatetags/common_tags.py`.
10. Шаблон для отрисовки меню находится в файле `./menu_builder/templates/menu.py`.
11. При клике на меню или пункт меню происходит переход по заданному в нем URL.
12. Активный пункт меню определяется исходя из URL текущей страницы.
13. Все что над активным пунктом меню - развернуто. Первый уровень вложенности под выделенным пунктом так же развернут.
14. Древовидная структура меню храниться в БД Postgres.
15. Меню храниться в виде [Nested Sets](https://postgres.men/database/postgresql/nested-sets-introduction/) с помощью модуля `django-mptt`.
16. На данный момент отрисовка меню занимает четыре связанных SQL запроса к БД, что оставляет простор для оптимизации и возможность свести их к 1 запросу в БД.
17. Локально приложение можно запустить командой `make start` из основной директории проекта. Для доступа к панели администратора необходимо создать суперпользователя командой `make admin`.
18. Фронтенд приложения - Bootstrap5.
