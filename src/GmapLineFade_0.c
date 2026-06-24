#include "global.h"

#include "hardware.h"
#include "spline.h"
#include "sysutil.h"

#include "worldmap.h"

struct GmapLineFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
};

//! FE8U = 0x080C0358
void GmapLineFade_0(struct GmapLineFadeProc * proc)
{
    u16 * bufA;
    u16 * bufB;
    int i;

    u16 * buf = GetWorldMapHblankBuffer(0, 1);

    int coeff = _DivArm2(proc->unk_2a, proc->unk_2c, 0);
    s16 a = DivArm(0x1000, (coeff * -0x80)) + 0x80;
    s16 b = DivArm(0x1000, (coeff * -0x80)) + 0x50;

    for (i = 0; i < 0x50; i++)
    {
        if (i >= a)
        {
            buf[i] = 0;
            continue;
        }

        if (i >= b)
        {
            s16 tmp = (i - b);
            coeff = _DivArm2(tmp, 0x30, 0);
            buf[i] = DivArm(0x1000, (coeff = (0x1000 - coeff)) * 0x10);
            continue;
        }

        buf[i] = 0x10;
    }

    bufA = buf;
    bufB = buf + 0x9f;
    for (i = 0; i < 0x50; i++)
    {
        *bufB-- = *bufA++;
    }

    FlipWorldMapHblankBuffer();

    return;
}
