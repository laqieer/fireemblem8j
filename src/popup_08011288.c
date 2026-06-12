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



/* prototypes for same-file helpers called by this run */
int ParsePopupInstAndGetLen(struct PopupProc * proc);

void PopupProc_PrepareGfx(struct PopupProc * proc)
{
    InitTextFont(0, GetBackgroundTileDataOffset(0) +
                   BG_SCREEN_ADDR(4), 0x100, 0);
    ResetIconGraphics();
    LoadUiFrameGraphics();
    SetDefaultColorEffects();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    proc->xGfxSize = ParsePopupInstAndGetLen(proc);
}
