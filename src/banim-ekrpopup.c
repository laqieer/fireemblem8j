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




/* prototypes for same-file helpers called by this run */
void EfxPlaySound5AVol100(void);
void DrawBattlePopup(struct ProcEkrPopup *proc, int type, u32 priv);

void ekrPopup_DrawWRankUp2(struct ProcEkrPopup *proc)
{
    u32 priv = proc->rbuf;
    if (priv != 0) {
        DrawBattlePopup(proc, 0, priv);
        EfxPlaySound5AVol100();
        
        proc->timer = 0;
        proc->terminator = 0x60;
    }

    Proc_Break(proc);
}
