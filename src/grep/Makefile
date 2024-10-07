CC = gcc 
FLAGS = -Wall -Werror -Wextra
GREP = s21_*.c
OBJECTS=*.o
BUILD_TEST := build_test.sh

all: style
	test_docker

s21_grep: clean
	$(CC) $(FLAGS) $(GREP) -o s21_grep

test_docker: clean s21_grep
	@chmod +x $(BUILD_TEST)
	./$(BUILD_TEST)

clean : 
	rm -rf s21_grep 
	rm -rf s21_grep.o

rebuild : clean s21_grep

style:
	clang-format -style=google -n *.c *.h 

format:
	clang-format -style=google -i *.c *.h