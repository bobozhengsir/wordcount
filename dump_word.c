#include <stdio.h>
#include "word_manage_p.h"

/**************************************************
 * 将内存中的单词输出
 **************************************************/
void dump_word(FILE *fp)
{
	Word *temp;

	for (pos = word_header; pos != NULL; pos = pos->next) {
		fprintf(fp, "%-20s%5d\n",
				pos->name, pos->count);
	}
}
