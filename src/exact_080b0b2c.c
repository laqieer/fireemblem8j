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







//! FE8U = 0x080AC078
void DifficultySelect_OnEnd(struct DifficultyMenuProc * proc)
{
    ((struct SaveMenuProc *)(proc->proc_parent))->savedraw->unk_29 = 1;
    return;
}
