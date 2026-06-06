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

void MapAnim_BeginWallBreakAnim(struct Unit * unit, int unk)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_MapAnimWallBreak, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 16 * (SCREEN_TILE_X(unit->xPos)) + 8;
    proc->yDisplay = 16 * (SCREEN_TILE_Y(unit->yPos)) - 8;

    proc->unk48 = unk ^ 1;
}

void WallBreakAnim_Init(struct MAEffectProc * proc)
{
    Decompress(
        Img_WallBreakAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    ApplyPalette(
        Pal_WallBreakAnim,
        16 + BM_OBJPAL_BANIM_EFFECT1);

    APProc_Create(
        Obj_WallBreakAnim,
        proc->xDisplay, proc->yDisplay + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, BM_OBJPAL_BANIM_EFFECT1),
        proc->unk48, 2);
}

void NewMapPoisonEffect(struct Unit * unit)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_PoisonAnimHandler, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (SCREEN_TILE_X(unit->xPos)));
    proc->yDisplay = 8 * (1 + 2 * (SCREEN_TILE_Y(unit->yPos)));
}

void MapAnim_BeginPoisonAnim(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_B7, proc->xDisplay);

    Decompress(
        Img_PoisonAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        Pal_PoisonAnim,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        Obj_PoisonAnim,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}

void NewMapAnimPoisonAnim2(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_PoisonAnim2, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}

void MapAnim_BeginPoisonAnim2(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_B7, proc->xDisplay);

    Decompress(
        Img_PoisonAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        Pal_PoisonAnim,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        Obj_PoisonAnim,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}
