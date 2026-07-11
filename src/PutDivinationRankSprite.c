/*
 * PutDivinationRankSprite: JP-only divination/augury rank-sprite OAM emitter.
 * Reconstructed from the JP assembly and matched with the Br4VJ live-range shape.
 */
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

extern const u16 *const gUnk_08A95478[];

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
    STRUCT_PAD(0x39, 0x3B);
    /* 3B */ u8 unk3B;
    STRUCT_PAD(0x3C, 0x3E);
    /* 3E */ u8 unk3E;
    STRUCT_PAD(0x3F, 0x52);
    /* 52 */ s16 spriteX;
    /* 54 */ s16 spriteY;
};

void PutDivinationRankSprite(struct DivinationSpriteProc * proc)
{
    int i;
    int col;
    int x;
    register int xStart asm("r2");
    int y;
    const u16 *const * objects;

    if (proc->unk3B == 0)
        return;

    for (i = 0; i < 5; i++)
    {
        if (proc->rowCounts[i] == 0xFF)
            continue;

        {
            register int xLoad asm("r0");

            xLoad = proc->spriteX;

            // Keep the signed load in r0 and split its live range before r2.
            asm("" : "+r"(xLoad));
            xStart = xLoad;
        }

        xStart += 0x34;
        xStart &= 0x1FF;

        {
            register int yLoad asm("r1");
            register int yOff asm("r0");

            yLoad = proc->spriteY;
            yOff = i;
            yOff <<= 4;
            yOff += 0x19;
            y = yLoad + yOff;
        }

        y &= 0xFF;

        col = 0;

        if (col <= proc->rowCounts[i])
        {
            x = xStart;

            do
            {
                PutSpriteExt(13, x, y, (objects = gUnk_08A95478)[col], 0xF380);
                x += 0xA;
                col++;
            }
            while (col <= proc->rowCounts[i]);
        }
    }

    if (proc->unk3E != 0)
    {
        x = (proc->spriteX + 0xC0) & 0x1FF;
        y = (proc->spriteY + 0x1C) & 0xFF;
        PutSpriteExt(13, x, y, gUnk_08A95478[0], 0xF380);
    }
}
