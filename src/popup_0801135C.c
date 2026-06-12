extern int ParsePopupInstAndGetLen();
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

void GeneratePopupText(const struct PopupInstruction *inst, struct Text th);

void PopupProc_GfxDraw(struct PopupProc * proc)
{
    struct Text th;
    int icon_pos;
    int tile_len;
    int x_pos, y_pos;
    int temp;

    u32 len;

    len = ParsePopupInstAndGetLen(proc);
    proc->xGfxSize = len;
    tile_len = (len << 0x10) >> 0x13;

    if (0 != (len & 7))
        tile_len++;

    icon_pos = (tile_len * 8 - proc->xGfxSize) >> 1;

    if (-1 == proc->xTileParam)
        x_pos = ((0x1E - tile_len) >> 1) - 1;
    else
        x_pos = proc->xTileParam;


    if (-1 != proc->yTileParam)
        y_pos = proc->yTileParam;
    else
        y_pos = 8;

    temp = tile_len + 2;
    DrawUiFrame2(x_pos, y_pos, temp, 4, proc->winStyle);

    proc->xTileReal = x_pos;
    proc->yTileReal = y_pos;
    proc->xTileSize = temp;
    proc->yTileSize = 3;
    proc->iconX += icon_pos;

    InitText(&th, tile_len);
    Text_SetColor(&th, proc->textColorId);
    Text_SetCursor(&th, icon_pos);
    GeneratePopupText(proc->pDefinition, th);

    if (0xFFFF != proc->iconId)
        LoadIconObjectGraphics(proc->iconId, proc->iconObjTileId);

    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x_pos + 1, y_pos + 1));
    ResetText();

    if (0xFFFF != proc->iconId) {
        struct PopupIconUpdateProc *child =
            Proc_Start(ProcScr_PopupUpdateIcon, proc);

        child->unk_2C = (proc->xTileReal + 1) * 8 + proc->iconX;
        child->unk_30 = (proc->yTileReal + 1) * 8;
        child->unk_4A = proc->iconObjTileId | (proc->iconPalId & 0xf) << 0xC;
    }
}
