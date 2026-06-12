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

//! FE8U = 0x080ABFE0
void DrawDifficultyModeText(struct DifficultyMenuProc * proc)
{
    const char * str;
    struct Text * th;
    int i;

    for (i = 0; i < 5; i++)
    {
        ClearText(&proc->unk_38[i]);
    }

    th = proc->unk_38;
    str = GetStringFromIndex(gTextIds_DifficultyDescription[proc->current_selection]);

    while (1)
    {
        if (*str == 0x00) // [X]
        {
            return;
        }

        if (*str == 0x01) // [NL]
        {
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }

    return;
}
