#include <stdarg.h>
#include <stdio.h>
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

extern struct Struct02026E30 gFontgrp_0;
void PrintDebugString(int a, int b, const char *str);
void FlushDBGToBG2(void);

//! FE8U = 0x08003A08
int UpdateDBGScroll(u16 a, u16 b)
{
    int r1;
    int r2;

    if (b & 2)
        return 0;

    FlushDBGToBG2();
    r1 = gFontgrp_0.unkC - 256;
    if (r1 < 0)
        r1 = 0;
    r2 = gFontgrp_0.unkC - 20;
    if (r2 < 0)
        r2 = 0;

    if ((a & 0x40) && r1 < gFontgrp_0.unk10)
        gFontgrp_0.unk10--;
    if ((a & 0x80) && r2 > gFontgrp_0.unk10)
        gFontgrp_0.unk10++;

    return 1;
}
