#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "prepscreen.h"

extern u8 gUnk_08A9A9E0[];
extern struct Text gUnk_02013580;

void PutImg_PrepItemUseUnk(int a, int b);
void Decompress(const void *src, void *dst);
void j_TmApplyTsa(void *dst, void *src, int a);
void ResetSysHandCursor(ProcPtr proc);
void DisplaySysHandCursorTextShadow(int a, int b);
void sub_80A2D48(void);
void sub_80A3018(void);

void sub_80A3118(ProcPtr proc)
{
    int i;
    struct Text *th;

    sub_80A2D48();
    PutImg_PrepItemUseUnk(0xa0 << 7, 5);
    Decompress(gUnk_08A9A9E0, gGenericBuffer);
    j_TmApplyTsa(gBG1TilemapBuffer, gGenericBuffer, 0xa5 << 7);
    BG_EnableSyncByMask(0x7);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0xc0 << 3, 1);

    SetWinEnable(0, 0, 0);
    SetWin0Box(0x80, 0x28, 0xe0, 0x98);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(0, 8, 8, 8);

    th = &gPrepItemTexts[0];
    for (i = 5; i >= 0; i--)
    {
        InitText(th, 8);
        th++;
    }
    InitText(&gUnk_02013580, 8);

    sub_80A3018();
    StartTalkFace(4, 0xd8, 0x58, 0x82, 0);
}
