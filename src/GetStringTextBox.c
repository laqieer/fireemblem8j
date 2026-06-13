#include "global.h"
#include <stdarg.h>
#include <stdio.h>
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

#define CHAR_NEWLINE 0x01

void GetStringTextBox(const char* _str, int *out_width, int *out_height)
{
    char *str;

    *out_width = 0;
    *out_height = 0;

    str = StringInsertSpecialPrefixByCtrl();
    while (*str != 0 && *str != CHAR_NEWLINE) {
        int width = GetStringTextLen(str);

        if (*out_width < width)
            *out_width = width;
        *out_height += 16;

        str = GetStringLineEnd(str);
        if (*str == 0)
            break;
        str++;
    }
}
