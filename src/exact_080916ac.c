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



// clang-format off





/* prototypes for same-file helpers called by this run */
u32 GetCgTextFlags(void);

//! FE8U = 0x0808F3D8
void CgText_AdjustBoxPosition(struct CgTextMainProc * proc)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        return;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_1)
    {
        proc->x += ~proc->boxWidth;
    }
    else
    {
        proc->x += 2;
    }

    proc->y -= proc->boxHeight;

    return;
}
