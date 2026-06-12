#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

extern EWRAM_OVERLAY(0) struct Text gaBattleForecastTextStructs[6];
extern EWRAM_OVERLAY(0) u16 gBkselPals[8][16];

/* prototypes for same-file helpers called by this run */
void InitBattleForecastIconPaletteBuffer(void);
void InitBattleForecastLabels(void);

void BattleForecast_Init(struct BattleForecastProc * proc)
{
    Decompress(gBattleForecast_x2x4Gfx, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void*)0x06015D00, 4, 2);
    ApplyPalette(gBattleForecast_x2x4Pal, 0x12);

    ResetTextFont();

    ResetIconGraphics_();

    InitBattleForecastIconPaletteBuffer();

    InitBattleForecastLabels();

    InitTextDb(&proc->unitNameTextA, 6);
    InitTextDb(&proc->unitNameTextB, 6);
    InitTextDb(&proc->itemNameText, 7);

    BG_SetPosition(1, 0, -1);

    proc->ready = 1;
}
