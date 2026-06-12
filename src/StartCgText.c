#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_CgTextMain[];

s8 DoesStringContainTact(const char * str);

// clang-format on

//! FE8U = 0x0808F128
void StartCgText(int x, int y, int width, int height, int stringId, void * vram, int pal, ProcPtr parent)
{
    int palTmp;
    int i;
    int mask;

    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc)
    {
        proc->str = GetStringFromIndex(stringId);
        if (DoesStringContainTact(proc->str))
        {
            proc->str = StringInsertSpecialPrefixByCtrl();
        }

        if (proc->blendAmt == 0x10)
        {
            Proc_Goto(proc, 3);
        }
        else
        {
            Proc_Goto(proc, 2);
        }

        return;
    }

    if (parent)
    {
        proc = Proc_StartBlocking(gProcScr_CgTextMain, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_CgTextMain, PROC_TREE_3);
    }

    SetCgTextFlags(CG_TEXT_BG(BG_1));
    ClearAllTalkFlags();

    proc->pFont = &gCgTextSt.font;

    for (i = 0; i < 6; i++)
    {
        proc->pTexts[i] = &gCgTextSt.texts[i];
    }

    proc->x = x;
    proc->y = y;
    proc->boxWidth = width;
    proc->boxHeight = height;
    proc->vram = vram;

    if (pal < 0)
    {
        pal = 5;
    }

    mask = 0xf;
    palTmp = (pal & mask);
    pal = palTmp + 0x10;

    if (vram == 0)
    {
        vram = (void *)0x06013000;
    }

    InitSpriteTextFont(proc->pFont, vram, pal);
    SetTextFont(NULL);

    ApplyPalette(gPal_HelpTextBox, pal);
    proc->palId = ((((uintptr_t)vram) << 0x11) >> 0x16) + ((pal & mask) << 0xc);

    proc->str = GetStringFromIndex(stringId);
    if (DoesStringContainTact(proc->str) != 0)
    {
        proc->str = StringInsertSpecialPrefixByCtrl();
    }

    return;
}
