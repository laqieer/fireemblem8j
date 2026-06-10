#include "global.h"
#include "fontgrp.h"

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};

extern struct Font *gActiveFont;
extern struct SpecialCharSt sSpecialCharStList[64];

void ResetTextFont(void)
{
    gActiveFont->chr_counter = 0;
    sSpecialCharStList[0].color = -1;
}
