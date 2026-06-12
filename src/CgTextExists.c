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

//! FE8U = 0x0808F284
s8 CgTextExists(void)
{
    if (Proc_Find(gProcScr_CgTextMain))
    {
        return 1;
    }

    return 0;
}
