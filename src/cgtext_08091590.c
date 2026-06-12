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

extern EWRAM_DATA struct CgTextSt gCgTextSt;

// clang-format off





//! FE8U = 0x0808F2BC
void CgText_ClearSpriteText(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        SpriteText_DrawBackgroundExt(proc->pTexts[i], 0);
    }

    SetTextFont(NULL);

    return;
}
