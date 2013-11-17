CC=gcc
CFLAGS=-I. -Wall
WORD_MAN_DEPS = word_manage.h word_manage_p.h

get_word: get_word.c get_word.h
	$(CC) -c -o $@ $< $(CFLAGS)

word_man: initialize.c add_word.c dump_word.c \
		finalize.c $(WORD_MAN_DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

word_count: get_word.o word_man.o 
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	@echo "clean project"
	rm *.o
	@echo "clean complete"
