#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

void StartScreenFlashing(int mask, int duration, int speed_fadein, int speed_fadeout, int r, int g, int b, ProcPtr parent)
{
    struct ProcScreenFlashing * proc = Proc_StartBlocking(ProcScr_ScreenFlashing, parent);

    proc->duration = duration;
    proc->mask = mask;
    proc->speed_fadein  = speed_fadein;
    proc->speed_fadeout = speed_fadeout;
    proc->r = r;
    proc->g = g;
    proc->b = b;
}
