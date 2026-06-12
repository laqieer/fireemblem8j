#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "ap.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void ManimLevelUp_StartLevelUpText(struct ManimLevelUpProc * proc)
{
    int ix, iy;
    int x, y;

    Decompress(Img_ManimLevelUpText, OBJ_VRAM0 + 0x1C0 * CHR_SIZE);
    ApplyPalettes(Pal_ManimLevelUp, 0x10 + 3, 3);

    ix = SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2;
    x = ix * 8 + 16;

    iy = SCREEN_TILE_Y(gManimSt.actor[proc->actor_id].unit->yPos) * 2;
    y = iy * 8 - 8;

    if (SCREEN_TILE_Y(gManimSt.actor[proc->actor_id].unit->yPos) * 2 < 4)
        y = y + 32;

    if (SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2 < 4)
        x = 48;

    if (SCREEN_TILE_X(gManimSt.actor[proc->actor_id].unit->xPos) * 2 > 25)
        x = 208;

    APProc_Create(gMapanimTorchfx_0, x, y, OAM2_CHR(0x1C0) + OAM2_PAL(0x3), 0, 2);
    PlaySoundEffect(SONG_5B);
}
