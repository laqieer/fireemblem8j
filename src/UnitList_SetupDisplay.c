#include "global.h"
extern const struct ProcCmd ProcScr_bmview[];
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08090D80
void UnitList_SetupDisplay(struct UnitListScreenProc * proc)
{
    int i;
    u8 val;

    SetDispEnable(1, 1, 1, 1, 1);

    SetInterrupt_LCDVCountMatch(NULL);
    SetupBackgrounds(NULL);
    ResetText();
    ResetTextFont();
    ResetIconGraphics();
    ApplyUnitSpritePalettes();

    CpuFastFill(0, gPaletteBuffer + 0x1B0, PLTT_SIZE_4BPP);

    LoadObjUIGfx();

    StartGreenText(proc);

    proc->deployedCount = 0;
    proc->unk_2e = 6;

    UnitList_BuildUnitList(proc);

    if ((proc->mode != UNITLIST_MODE_PREPMENU) || (proc->unk_2a == 1))
    {
        val = gPlaySt.lastUnitSortType;

        if (val != 0)
        {
            proc->unk_33 = (val >> 7) & 1;
            proc->unk_34 = proc->unk_33;
            proc->unk_32 = val & 0x7f;
        }

        if ((proc->unk_29 != 4) && (proc->page != 0))
        {
            val = gPlaySt.unk19 / 16;

            if (val != 0)
            {
                if (val > 6)
                {
                    proc->page = 6;
                }
                else
                {
                    proc->page = val;
                }

                proc->pageTarget = proc->page;
            }
        }

        SortUnitList(proc->unk_32, proc->unk_34);
    }

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadUiFrameGraphics();

    Decompress(Img_UnkData_1, (void *)0x06014800);
    Decompress(proc->page != 0 ? Img_UnitListBanners : Img_UnitListBanner_Animation, (void *)0x06015800);

    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);

    ApplyPrepWindowColorPalette();

    CallARM_FillTileRect(gBG1TilemapBuffer, gUnkData_77, 0x1000);

    for (i = 0; i < 7; i++)
    {
        InitText(&gUnitlistscreen_2[i], 5);
        InitTextDb(&gUnitlistscreen_3[i][0], 8);
        InitText(&gUnitlistscreen_3[i][1], 7);
        InitText(&gUnitlistscreen_3[i][2], 5);
    }

    InitText(&gUnitlistscreen_4, 4);
    InitText(&gUnitlistscreen_5, 20);
    InitText(&gUnitlistscreen_6, 8);

    UnitList_DrawSortLabel(proc->unk_32);

    if (proc->unk_29 == 4)
    {
        UnitList_SetCursorToUnit(proc, 0);
        proc->unk_29 = 0;
    }
    else if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        UnitList_SetCursorToUnit(proc, 1);
    }

    proc->unk_3c = 0;
    proc->helpActive = 0;

    ClearText(&gUnitlistscreen_4);
    Text_SetCursor(&gUnitlistscreen_4, 4);
    Text_SetColor(&gUnitlistscreen_4, 0);
    Text_DrawString(&gUnitlistscreen_4, GetStringFromIndex(0x474));
    PutText(&gUnitlistscreen_4, TILEMAP_LOCATED(gBG2TilemapBuffer, 3, 5));

    for (i = 0; i < 20; i++)
    {
        gUnitlistscreen_9[i] = UINT8_MAX;
    }

    for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnitlistscreen_8; i++)
    {
        UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
    }

    UnitList_DrawPageHeader(proc->unk_2e, proc->page, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(16, 58, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    BG_SetPosition(BG_3, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_0, 0, (proc->unk_3e - 56) & 0xff);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Decompress(gImg_UiSpinningArrow_Horizontal, gBG1TilemapBuffer + 0x280);
    ApplyPalette(Pal_SpinningArrow, 0xf);

    proc->pSpriteProc = Proc_Start(ProcScr_bmview, proc);
    proc->pMuralProc = StartMuralBackground(0, 0, 10);
    LoadHelpBoxGfx(0, -1);

    return;
}
