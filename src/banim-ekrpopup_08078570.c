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

extern EWRAM_OVERLAY(banim) struct ProcEkrPopup *gpProcEkrPopup;
extern EWRAM_OVERLAY(banim) int gEkrPopupEnded;

/* prototypes for same-file helpers called by this run */
void EfxPlaySound5CVol100(void);
void DrawBattlePopup(struct ProcEkrPopup *proc, int type, u32 priv);

void ekrPopup_DrawWpnBroke(struct ProcEkrPopup *proc)
{
    u32 priv = proc->ldebuf;
    if (priv != 0) {
        DrawBattlePopup(proc, 1, priv);
        EfxPlaySound5CVol100();
        
        proc->timer = 0;
        proc->terminator = 0x6C;
    }

    Proc_Break(proc);
}
