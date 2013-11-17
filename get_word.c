#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

#include "get_word.h"

int get_word(char *buf, int size, FILE *stream)
{
	int len;
	int ch;

	/* 跳过读取空白字符 */
	while ((ch = getc(stream)) != EOF && !isalnum(ch))
		;
	if (ch == EOF)
		return EOF;

	/* 此时，ch中保存了单词的初始字符 */
	len = 0;
	do {
		buf[len] = ch;
		len++;
		if (len >= size) {
			/* 由于单词太长，提示错误 */
			fprintf(stderr, "word too long.\n");
			exit(1);
		}
	} while ((ch = getc(stream)) != EOF && isalnum(ch));
	buf[len] = '\0';

	return len;
}
