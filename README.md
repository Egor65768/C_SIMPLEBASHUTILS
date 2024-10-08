# C_SIMPLEBASHUTILS

В этом проекте разработаны Bash утилиты по работе с текстом: cat, grep. Флаги, которые были реализованы указаны ниже.
Утилиты поддерживают работу с несколькими файлами. Для тестирования был написан bash скрипт.
Так как работа этих утилит немного отличается на разных системах, для тестирования я написал Dockerfile.
Контейнер создается на базе Ubuntu и запускает тесты
Проект выполнен на языке С

## Руководство по использованию

- Мэйкфайлы находятся в папках /src/cat/ и /src/grep/

### Для проверки на стиль кода утилиты cat/grep и создания исполняемого файла:

```make all```

### Для создания исполняемого файла:

```make s21_grep```

### Для запуска тестов:

```make test```
- Внимание если тесты фейлятся, запустите тесты через докер (работа данных утилит на разных осях может отличаться)

### Для запуска через Docker:

```make test_docker```

### Для отчистки проекта от всех временных и промежуточных файлов:

```make clean```

### Для начиная с удаления старых файлов и создания новой версии исполняемого файла:

```make rebuild```

### Для проверки стиля кода:

```make style```

### Для применения стиля форматирования Google к коду:

```make format```


## CAT

### Опции cat

| № | Опции | Описание |
| ------ | ------ | ------ |
| 1 | -b (GNU: --number-nonblank) | нумерует только непустые строки |
| 2 | -e предполагает и -v (GNU only: -E то же самое, но без применения -v) | также отображает символы конца строки как $  |
| 3 | -n (GNU: --number) | нумерует все выходные строки |
| 4 | -s (GNU: --squeeze-blank) | сжимает несколько смежных пустых строк |
| 5 | -t предполагает и -v (GNU: -T то же самое, но без применения -v) | также отображает табы как ^I |

## GREP

### Опции grep 

| № | Опции | Описание |
| ------ | ------ | ------ |
| 1 | -e | Шаблон. |
| 2 | -i | Игнорирует различия регистра.  |
| 3 | -v | Инвертирует смысл поиска соответствий. |
| 4 | -c | Выводит только количество совпадающих строк. |
| 5 | -l | Выводит только совпадающие файлы.  |
| 6 | -n | Предваряет каждую строку вывода номером строки из файла ввода. |
| 7 | -h | Выводит совпадающие строки, не предваряя их именами файлов. |
| 8 | -s | Подавляет сообщения об ошибках о несуществующих или нечитаемых файлах. |
| 9 | -f file | Получает регулярные выражения из файла. |
| 10 | -o | Печатает только совпадающие (непустые) части совпавшей строки. |

