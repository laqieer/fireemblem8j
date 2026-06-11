#include "global.h"
#include "hardware.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "icon.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrlevelup.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "constants/songs.h"

void ekrPopup_WaitWpnUsable(struct ProcEkrPopup *proc)
{
    if (proc->rdebuf == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator) {
        proc->timer = 0;
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}
