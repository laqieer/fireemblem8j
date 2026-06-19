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




void ekrPopup_WaitWpnBroke(struct ProcEkrPopup *proc)
{
    if ((*(int *)((char *)proc + 0x44)) == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator) {
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}
