#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"


















extern struct PopupInstruction CONST_DATA PopupScr_GoldWasStole[];







extern struct PopupInstruction CONST_DATA PopupScr_WRankUp[];



void BrownTextBox_Loop(struct BrownTextBoxProc * proc)
{
    int i;

    int oam2A = (((proc->chr + 0x400) & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL((proc->pal + 1));
    int oam2B = ((proc->chr & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL(proc->pal);

    PutSpriteExt(4, proc->x, proc->y + proc->oam0Attr, gObject_16x8, oam2B);
    PutSpriteExt(4, proc->x + (proc->width - 2) * 8, proc->y + proc->oam0Attr, gObject_16x8, oam2B + 4);
    PutSpriteExt(4, proc->x, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 0xd);
    PutSpriteExt(
        4, proc->x + (proc->width - 2) * 8, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 0x11);

    PutSpriteExt(4, proc->x, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 6);
    PutSpriteExt(4, proc->x, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 11);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 10);
    PutSpriteExt(4, proc->x + (proc->width - 1) * 8, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 12);

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, gObject_16x8, oam2B + 2);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + proc->oam0Attr, gObject_8x8, oam2B + 2);
    }

    for (i = 2; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 24 + proc->oam0Attr, gObject_16x8, oam2B + 15);
    }

    for (i = 1; i < proc->width - 2; i += 2)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, gObject_16x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, gObject_16x8, oam2B + 8);
    }

    for (; i < proc->width - 1; i++)
    {
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8 + proc->oam0Attr, gObject_8x8, oam2B + 8);
        PutSpriteExt(4, proc->x + i * 8, proc->y + 16 + proc->oam0Attr, gObject_8x8, oam2B + 8);
    }

    for (i = 0; i < 3; i++)
    {
        PutSpriteExt(0, proc->x + 8 + (i * 32), proc->y + 8 + proc->oam0Attr, gObject_32x16, oam2A + i * 4);
    }
}
