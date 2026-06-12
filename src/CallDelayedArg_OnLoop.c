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

void CallDelayedArg_OnLoop(struct CallDelayedProc * proc)
{
    proc->clock--;

    if (proc->clock == -1)
    {
        void (* func)(int) = (void(*)(int)) proc->func;

        func(proc->arg);
        Proc_Break(proc);
    }
}
