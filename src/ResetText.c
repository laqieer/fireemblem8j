#include "global.h"
#include "fontgrp.h"

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};

extern struct Font gDefaultFont;
extern struct SpecialCharSt sSpecialCharStList[64];

void ResetText(void)
{
    InitTextFont(&gDefaultFont, (void *)(VRAM + 0x1000), 0x80, 0);
    sSpecialCharStList[0].color = -1;
}
