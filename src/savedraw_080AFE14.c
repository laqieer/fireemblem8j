#include "global.h"
#include <string.h>


#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"

#include "savemenu.h"

extern const u8 SaveDrawCursorYOffsetLut[];

//! FE8U = 0x080AB340
void SaveDrawCursor_Loop(struct SaveDrawCursorProc * proc)
{
    s16 yOam0;
    s16 xOam1;
    s16 xOam1_;

    u8 yOffsetLut[8];

    memcpy(yOffsetLut, SaveDrawCursorYOffsetLut, 8);

    if ((s8)((struct SaveMenuProc *)(proc->proc_parent))->scroll_cnt == 0) {
        return;
    }

    proc->unk_2a++;

    if (proc->sus_slot < 4) {
        proc->sus_slot++;
    }

    if (proc->cursor_en != 0) {
        yOam0 = proc->unk_32;
        xOam1 = proc->unk_2e;

        if (proc->sus_slot < 4) {
            yOam0 = (proc->unk_32 - proc->unk_34) / 2 + proc->unk_34;
            xOam1 = (proc->unk_2e - proc->main_options) / 2 + proc->main_options;
        }

        if (proc->unk_3a == 0) {
            xOam1_ = (xOam1) + 0x9c;
        } else {
            xOam1_ = (xOam1) + 0xb0;
        }

        proc->unk_34 = proc->unk_32;
        proc->main_options = proc->unk_2e;

        if (proc->unk_3a == 0) {
            PutSpriteExt(
                4,
                xOam1 & 0x1FF,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_Savedraw_3,
                0x3000
            );

            xOam1 = xOam1_;

            PutSpriteExt(
                4,
                (xOam1 & 0x1FF) | 0x1000,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_Savedraw_3,
                0x3000
            );
        } else {
            PutSpriteExt(
                4,
                4,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_Savedraw_3,
                0x3000
            );
        }

        proc->sus_slot = 0;
    } else {
        if (proc->sus_slot == 4) {
            proc->cursor_en = 0;
        }
    }

    if (proc->unk_38 != 0) {
        PutSpriteExt(4, 6, proc->unk_37, Sprite_Savedraw_3, 0x3000);
    }

    if (proc->unk_39 != 0) {
        proc->unk_38 = 0;
    }

    proc->cursor_en = 0;
    proc->unk_39 = 1;

    return;
}
