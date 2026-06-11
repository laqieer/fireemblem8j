#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

void TemporaryLock_OnLoop(struct Proc * proc)
{
    if (proc->unk58 == 0)
    {
        Proc_Break(proc);
        return;
    }
    proc->unk58--;
}
