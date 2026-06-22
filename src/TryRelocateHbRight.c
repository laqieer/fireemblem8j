#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

int TryRelocateHbRight(struct HelpBoxProc* proc)
{
    if (!proc->info->adjRight)
        return FALSE;

    proc->info    = proc->info->adjRight;
    proc->moveKey = DPAD_RIGHT;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}
