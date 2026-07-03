#include "global.h"
#include "hardware.h"
#include "fontgrp.h"

struct AuguryInitProc
{
    PROC_HEADER;
    /* 2C */ int unk2c;
    /* 30 */ int unk30;
    /* 34 */ int unk34;
};

extern void ResetText(void);

extern void LoadLegacyUiFrameGraphics(void);
extern void EnablePaletteSync(void);
extern void DrawUiFrame2(int a, int b, int c, int d, int e);
extern u8 sub_80A723C(int x, int y);
extern void sub_80A6A30(int a, int b);
extern void sub_80A6E4C(void * func);
extern void sub_80A730C(void * a, void * b);
extern void sub_80A705C(void);

extern struct Text gAuguryTexts_02014EFC[];
extern u8 gRom_08A95DDC[];

void sub_80A74D4(struct AuguryInitProc * proc)
{
    int i;
    struct Text * text;

    SetupBackgrounds(0);
    ResetTextFont();
    ResetText();

    SetDispEnable(1, 1, 1, 1, 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    LoadLegacyUiFrameGraphics();
    EnablePaletteSync();

    BG_Fill((void *)0x02022CA8, 0);
    BG_Fill((void *)0x020234A8, 0);
    BG_Fill((void *)0x02023CA8, 0);
    BG_Fill((void *)0x020244A8, 0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    DrawUiFrame2(2, 6, 0x1a, 7, 2);
    BG_EnableSyncByMask(0xf);

    text = gAuguryTexts_02014EFC;
    for (i = 2; i >= 0; i--)
    {
        InitText(text, 0x1b);
        text++;
    }

    if (!sub_80A723C(proc->unk30, proc->unk34))
    {
        Proc_Goto(proc, 0x63);
    }
    else
    {
        sub_80A6A30(5, 0x11);
        sub_80A6E4C((void *)sub_80A705C);
        sub_80A730C((void *)gAuguryTexts_02014EFC, gRom_08A95DDC);
        proc->unk2c = (int)StartMuralBackground((ProcPtr)0, (void *)0, 0xa);
    }
}
