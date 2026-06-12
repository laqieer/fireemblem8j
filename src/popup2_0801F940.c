#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"

/**
 * It's like a popup but for some reason it's not
 */


/* struct definitions */

struct Popup2Proc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4c */ u16 timer;
};


/* function declarations */

void ProcPopup2_Init(struct Popup2Proc *proc);
void ProcPopup2_Loop(struct Popup2Proc *proc);


/* section.data */

extern struct ProcCmd CONST_DATA ProcScr_Popup2[];

void NewPopup2_PlanC(ProcPtr parent, int item, int msg)
{
    int len, x, y, x_tile, y_tile;

    struct Text th;

    ResetTextFont();
    InitText(&th, 0x14);
    Text_SetColor(&th, TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawString(&th, GetItemName(item));
    Text_Skip(&th, 2);
    Text_SetColor(&th, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&th, GetStringFromIndex(msg));

    len = Text_GetCursor(&th);
    len += 0x28;

    x_tile = 0xF0 - len;

    if (x_tile < 0)
        x_tile += 0xF;
    x = x_tile >> 4;

    y_tile = len < 0 ? len + 7 : len;
    y = y_tile >> 3;

    DrawUiFrame2(x, 8, y, 4, 0);
    DrawIcon(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 9),
        GetItemIconId(item),
        TILEREF(0, 0x4)
    );

    PutText(&th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 3, 9));
    Proc_StartBlocking(ProcScr_Popup2, parent);

}
