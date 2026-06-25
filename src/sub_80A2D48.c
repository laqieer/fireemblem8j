#include "global.h"
#include "hardware.h"
#include "face.h"
#include "fontgrp.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "prepscreen.h"

void sub_80A2D48(void)
{
    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);
    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();
    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    LoadIconPalettes(4);
    RestartMuralBackground();
}
