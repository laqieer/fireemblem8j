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

//! FE8U = 0x0808F30C
void CgText_ResetSpriteTextCursors(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        Text_SetCursor(proc->pTexts[i], 0);
    }

    return;
}
