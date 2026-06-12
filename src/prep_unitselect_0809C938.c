#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc)
{
    int i;
    for (i = 0; i < PrepGetUnitAmount(); i++) {
        u32 yOff = ((i >> 1) << 4) - proc->yDiff_cur;
        if((yOff + 0xF) < 0x60 )
            PutUnitSprite(0, (i & 1) * 56 + 0x70, yOff + 0x18,
                        GetUnitFromPrepList(i));
    }

    if (proc->yDiff_cur & 0xF) {
        SetWinEnable(1, 1, 0);
        SetWin0Box(0, 0, 0xF0, 0x1A);
        SetWin1Box(0, 0x78, 0xF0, 0xA0);
        SetWin0Layers(1, 1, 0, 1, 0);
        SetWin1Layers(1, 1, 0, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 1);
    } else {
        SetWinEnable(0, 0, 0);
    }

    if (proc->button_blank)
        proc->button_blank++;

    /* Chapter goal */
    for (i = 0; i < 3; i++)
        PutSpriteExt(4, 4 + i * 0x20, 0x81, gObject_32x16, 0x8700 + 4 * i);

    /* "Start" button */
    if (0 == ((proc->button_blank >> 2) & 1) && proc->cur_counter) {
        if (CheckInLinkArena())
            PutSpriteExt(4, 0x80, 0x82,obj_PrepUnitselect_1, 0x40);
        else
            PutSpriteExt(4, 0x80, 0x82,Sprite_PrepStartButton, 0x40);
    }

    /* "Select" button */
    PutSpriteExt(4, 0x80, 0x8F, obj_PrepUnitselect_0, 0x40);

    SyncUnitSpriteSheet();
}
