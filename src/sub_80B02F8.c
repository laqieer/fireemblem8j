#include "global.h"

#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

extern const int SaveMenuSubSelBoxTexts[];
void SaveMenuDrawSubSelBoxExt(const void * text, int flag);

void SaveMenuDrawSubSelBox(struct SaveMenuProc * proc, s8 flag)
{
    int f = flag;
    SaveMenuDrawSubSelBoxExt((const void *)SaveMenuSubSelBoxTexts[BitfileToIndex(proc->main_sel_bitfile)], f);
    if (f == 0)
        proc->cursor_config = 0;
}
