#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"


struct Struct02026E30
{
    u32 tileDataOffset;
    s16 bg;
    u16 tileIndex;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    char unk14[256][32];
};
struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};
extern int gFontgrp_1;
extern int gFontgrp_2;

void PrintDebugStringAsOBJ(int a, int b, const char *str)
{
    while (*str != 0)
    {
        char c;

        if (*str > 0x60)
            c = *str - 0x40;
        else
            c = *str - 0x20;

        CallARM_PushToSecondaryOAM(a, b, gObject_8x8, c + gFontgrp_1 + gFontgrp_2);

        a += 8;
        str++;
    }
}
