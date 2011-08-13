Помоги Коту
===========

Саше нужен литр водки.

У нас есть 5 сосудов:

* 3л
* 5л
* кран с водой
* кран со спиртом
* унитаз

Рядом сидит Обобщенный Сомневающийся Кот Шрёдигера. Иногда мы будем просить Кота сделать что-нибудь с имеющимися активами. Что именно делать, Кот не знает, и о цели манипуляций не задумывается. Поэтому при каждой просьбе его начинают мучать сомнения, да так, что ему приходится размножить реальность, чтобы избежать проблемы выбора.

Собственно, действие - это просто переливание жидкости из одного сосуда в другой. Санэпидемнадзор запретил нам брать воду из унитаза, поэтому здесь мы немного ограничены. К тому же, технически проблематично вылить что-либо в кран со спиртом или водой. Итого остаются вот какие действия:

* 3л -- 5л, У
* 5л -- 3л, У
* вода -- 3л, 5л
* спирт -- 3л, 5л

Итого 8 вариантов действий. Не все так плохо, на каждом шаге Коту придется создавать всего 8 новых реальностей. И если вдруг (совершенно случайно) в какой-то из них образуется 1л ВОДКИ, то мы сможем решить исходную задачу, хотя бы в том мире. Разведка докладывает, что потребуется не более 6 шагов, то есть общее количество реальностей ограничено `8**6 = 2**18` - Кот выходил и из худших передряг.


Что получилось
--------------

```
> ruby vodka.rb
[{:spirits=>:b3}, {:b3=>:b5}, {:water=>:b3}, {:b3=>:b5}, {:b5=>:b3}, {:b3=>:b5}]
```

То есть при ограничении в 6 шагов решение всего одно. Если описать его
словами:

1. Кран со спиртом - 3л
2. 3л - 5л
3. Кран с водой - 3л
4. 3л - 5л. На этом шаге в 5л ведре находится 3л спирта + 2л воды -
   Огненная Вода. Надо разбавлять. В 3л ведре остался 1л воды
5. 5л - 3л. В 3л находится 3л обычной Водки, в 5л - 3 литра Огненной Воды
6. 3л - 5л. В 3л остался искомый 1л Водки

Теперь Кот может вполне обоснованно утверждать, что быстрее, чем за 6
шагов 1л Водки здесь не получить.
