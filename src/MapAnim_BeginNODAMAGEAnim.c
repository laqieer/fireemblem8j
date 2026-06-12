#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "mapanim.h"
#include "bmlib.h"
#include "bmtrick.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/songs.h"

void MapAnim_BeginNODAMAGEAnim(struct Unit * unit)
{
    Decompress(
        Img_MapAnimNODAMAGE,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    APProc_Create(
        obj_MapAnimNODAMAGE,
        16 * (SCREEN_TILE_X(unit->xPos)) + 8,
        16 * (SCREEN_TILE_Y(unit->yPos)) + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, 0), 0, 2);
}
