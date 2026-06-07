#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/**
 * section.ewramdata
 */
















/**
 * section.data
 */











void EkrLvup_OnPrepare(struct ProcEkrLevelup *proc)
{
    int timer;

    if (proc->is_promotion) {
        Proc_Break(proc);
        return;
    }

    timer = ++proc->timer;

    if (timer == 1) {
        NewEfxSpellCast();
        NewEfxLvupOBJ2(proc->ais_main, 0x78, 0x58);
        return;
    }

    if (timer == 25) {
        NewEfxLvupBG2(proc->ais_main);
        NewEfxLvupBGCOL(proc->ais_main);
        return;
    }

    if (timer == 59) {
        NewEfxlvupbg(proc->ais_main);
        return;
    }

    if (timer == 73) {
        RegisterEfxSpellCastEnd();
        return;
    }

    if (timer == 83) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
}
