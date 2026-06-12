#include "global.h"

#include "face.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmio.h"
#include "prepscreen.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

/**
 * Battle result screen for the Link Arena.
 * Not to be confused with "sio_result.c", which refers to the
 * "Battle Data" UI.
 */

// clang-format off

extern u16 const * CONST_DATA SpriteArray_SioPostbattle_0[];

extern u16 const * CONST_DATA SpriteArray_SioPostbattle_1[];

extern s16 const gSioPostbattle_0[5][4];

extern u8 const gSioPostbattle_1[3];

//! FE8U = 0x0804538C
void SioPostBattleSprites_Loop_DrawStatic(struct SioPostBattleSpritesProc * proc)
{
    PutSprite(4, proc->x, proc->y - 16, SpriteArray_SioPostbattle_1[proc->ranking], 0);
    PutSprite(4, proc->x + 72, proc->y - 6, SpriteArray_SioPostbattle_0[proc->oam2], 0);
    PutSprite(4, proc->x + 96, proc->y + 8, Sprite_SioMain2_8, 0);
    PutSprite(4, proc->x + 64, proc->y + 8, Sprite_SioMain2_10, proc->ranking * 4 + 0x50);
    PutSprite(4, -proc->x + 112, proc->y - 8, Sprite_LinkArena_NameBanner, OAM2_PAL(proc->oam2) + 0x400);
    PutSprite(4, -proc->x + 124, proc->y, Sprite_SioMain2_9, proc->oam2 == 3 ? 0x40 : proc->oam2 * 9);
    PutSprite(5, -proc->x + 208, proc->y - 8, Sprite_SioMain2_11, OAM2_PAL(proc->oam2 + 10) + 0x180 + (proc->oam2 << 3));

    return;
}
