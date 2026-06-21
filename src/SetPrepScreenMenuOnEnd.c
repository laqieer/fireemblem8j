#include "global.h"
#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

//! FE8U
void SetPrepScreenMenuOnEnd(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_End = func;
}
