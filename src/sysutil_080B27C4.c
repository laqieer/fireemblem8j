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

void NewSysboxText(int vobj_offset, int pal, const char * str, int line, int delay, int speed, ProcPtr parent)
{
    int i, obj_pal;
    struct ProcSysboxText * proc;
    proc = Proc_Find(ProcScr_SysboxText);
    if (!proc)
        proc = Proc_StartBlocking(ProcScr_SysboxText, parent);

    InitSpriteTextFont(&proc->font, OBJ_VRAM0 + vobj_offset, pal);
    proc->str = str;
    proc->line = 0;
    proc->max_line = line;
    proc->timer = 0;
    proc->delay = delay;
    proc->speed = speed;

    obj_pal = pal + 0x10;
    for (i = 0; i < line; i++)
    {
        InitSpriteText(&proc->texts[i]);
        SpriteText_DrawBackgroundExt(&proc->texts[i], 0);
    }

    ApplyPalette(Pal_Text, obj_pal);
    SetTextFontGlyphs(0);
    SetTextFont(NULL);
    Proc_Goto(proc, 0);
}
