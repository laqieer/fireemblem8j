#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

extern const u16 SubtitleHelp_SpriteTileLut[];

void PutSubtitleHelpText(struct SubtitleHelpProc * proc, int y)
{

    int i;

    for (i = 0; i < 9; i++) {
        int x = (i * 32) - 32 + proc->textOffset;
        int index = (proc->textNum + i) % proc->textCount;

        PutSprite(2, x, y, gObject_32x16, 0x4240 + SubtitleHelp_SpriteTileLut[index]);
    }

    return;
}
