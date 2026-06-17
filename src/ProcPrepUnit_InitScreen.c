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



void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc);
void PrepUnit_AdjustScrollToCursor(struct ProcPrepUnit *proc);
void PrepUnit_InitTexts();
void PrepUnit_InitGfx();
void PrepUnit_InitSMS(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitItems(struct Unit *unit);
void PrepUnit_DrawLeftUnitName(struct Unit *unit);
void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val);

void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc)
{
    int i;
    SetupBackgrounds(gBgConfig_ItemUseScreen);
    SetDispEnable(0, 0, 0, 0, 0);
    PrepUnit_AdjustScrollToCursor(proc);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
    BG_SetPosition(BG_3, 0, 0);

    PrepUnit_InitTexts();
    PrepUnit_InitGfx();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
    SetDefaultColorEffects();

    PrepUnit_InitSMS(proc);
    StartParallelWorker(PrepUnit_DrawSMSAndObjs, proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 0x1);
    ShowSysHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);

    StartMenuScrollBarExt(proc, 0xE0, 0x20, 0x200, 2);
    UpdateMenuScrollBarConfig(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
    StartHelpPromptSprite(0x20, 0x8F, 9, proc);
    PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
    PrepUnit_DrawLeftUnitName(GetUnitFromPrepList(proc->list_num_cur));

    for (i = 0; i < 6; i++)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 + i);

    PrepUnit_DrawPickLeftBar(proc, 0);
    StartGreenText(proc);
    LoadHelpBoxGfx(BG_SCREEN_ADDR(0x29), 5);
    RestartMuralBackground();
}
