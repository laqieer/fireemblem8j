#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

extern struct Unknown_08A209FC gDifficultymenu_0[];

extern u16 Pal_SaveMenuBG[];
extern u16 Pal_MainMenuBgFog[];
extern u16 Pal_SaveScreenSprits[];
extern u16 Pal_MenuMainObjs_0[];
extern u16 Pal_DifficultyMenuObjs[];
extern u8 Img_DifficultyMenuObjs[];
extern u8 Tsa_DifficultyMenuObjs[];

//! FE8U = 0x080AC084
void InitDifficultySelectScreen(struct DifficultyMenuProc * proc)
{
    int i;

    ResetTextFont();
    LoadUiFrameGraphics();
    ResetText();

    for (i = 0; i < 5; i++)
    {
        InitText(&proc->unk_38[i], 14);
    }

    ApplyPalettes(Pal_SaveMenuBG, 8, 8);
    ApplyPalette(Pal_MainMenuBgFog, 7);

    ApplyPalettes(Pal_SaveScreenSprits, 18, 8);
    ApplyPalette(Pal_MenuMainObjs_0, 2);

    Decompress(Img_DifficultyMenuObjs, (void *)0x06010800);
    ApplyPalettes(Pal_DifficultyMenuObjs, 17, 10);

    EnablePaletteSync();

    ((struct SaveMenuProc *)(proc->proc_parent))->savedraw->unk_29 = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    CallARM_FillTileRect(gBG1TilemapBuffer + 0xd1, Tsa_DifficultyMenuObjs, 0x1000);

    DrawDifficultyModeText(proc);
    DifficultySelect_PutModeText(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc->sprites_proc = StartDrawDifficultyMenuSprites(proc);
    proc->current_selection = 0;
    proc->sprites_proc->current_selection = 0;
    proc->sprites_proc->unk_2c = gDifficultymenu_0[proc->current_selection].a;
    proc->sprites_proc->unk_2e = gDifficultymenu_0[proc->current_selection].b;

    return;
}
