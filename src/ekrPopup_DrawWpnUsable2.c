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

void ekrPopup_DrawWpnUsable2(struct ProcEkrPopup *proc)
{
    u32 priv;

    priv = proc->ldebuf;
    if (priv == -1) {
        Proc_Goto(proc, 0x5);
        return;
    }

    if (proc->rbuf != 0) {
        DrawBattlePopup(proc, 2, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->terminator = 0x60;
    }

    Proc_Break(proc);
}
