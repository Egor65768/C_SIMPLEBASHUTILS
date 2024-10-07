CC = gcc 
FLAGS = -Wall -Werror -Wextra
CAT = s21_*.c
OBJECTS=*.o
BUILD_TEST := build_test.sh

all: style
	s21_cat

s21_cat: clean
	$(CC) $(FLAGS) $(CAT) -o s21_cat

test_docker: clean s21_cat
	@chmod +x $(BUILD_TEST)
	./$(BUILD_TEST)


clean : 
	rm -rf s21_cat 
	rm -rf s21_cat.o

rebuild : clean all

style:
	clang-format -style=google -n *.c *.h 

format:
	clang-format -style=google -i *.c *.h