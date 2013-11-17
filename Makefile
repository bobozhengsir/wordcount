CC=gcc
CFLAGS=-I. -Wall
DEPS = get_word.h word_manage.h word_manage_p.h
OBJ = get_word.o initialize.o add_word.o \
      dump_word.o finalize.o main.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

wordcount: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	@echo "clean project"
	-rm *.o
	@echo "clean complete"
