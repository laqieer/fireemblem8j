#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void FadeIn_Loop(struct ProcFadeInOut * proc)
{
    int color;

    proc->timer += proc->speed;

    if (proc->white_out != false)
        color = 0x200 - proc->timer * 2;
    else
        color = proc->timer * 2;

    WriteFadedPaletteFromArchive(color, color, color, proc->mask);
    SetDispEnable(1, 1, 1, 1, 1);

    if (proc->timer == 0x80)
        Proc_Break(proc);
}

void FadeOut_Loop(struct ProcFadeInOut * proc)
{
    int color;

    proc->timer += proc->speed;

    if (proc->white_out != false)
        color = 0x100 + proc->timer * 2;
    else
        color = 0x100 - proc->timer * 2;

    WriteFadedPaletteFromArchive(color, color, color, proc->mask);

    if (proc->timer == 0x80)
        Proc_Break(proc);
}

void FadeInOut_DisableGfx(struct ProcFadeInOut * proc)
{
    if (proc->mask == 0xFFFF)
    {
        SetDispEnable(0, 0, 0, 0, 1);
    }
    else
    {
        SetDispEnable(0, 0, 0, 0, 0);
    }
}

bool FadeInExists(void)
{
    return !!Proc_Find(ProcScr_BmFadeIN);
}

bool FadeOutExists(void)
{
    return !!Proc_Find(ProcScr_BmFadeOUT);
}

void NewFadeIn(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeOut(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeIn(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeIN, parent);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeOut(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeOUT, parent);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeIn2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeOut2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeInWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeOutWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeInWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeIN, parent);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeOutWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeOUT, parent);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeInWhite2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeOutWhite2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void WipeAllPalette(void)
{
    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
}

void EndFadeInOut(void)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));
}
