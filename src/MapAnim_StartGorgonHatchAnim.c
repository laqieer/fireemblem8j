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

void MapAnim_StartGorgonHatchAnim(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_MapAnimGorgonHatch, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}
