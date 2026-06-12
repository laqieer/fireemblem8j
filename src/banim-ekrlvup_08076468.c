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

void EkrLvup_Promo_WindowScroll0(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    SetPrimaryHBlankHandler(EfxPartsofScroll2HBlank);

    Proc_End(gpProcEfxPartsofScroll);
    gpProcEfxPartsofScroll = NewEfxPartsofScroll2();

    EfxPlaySE(SONG_2CD, 0x100);
    M4aPlayWithPostionCtrl(SONG_2CD, 0x38, 0);
    
    proc->timer = 0;
    proc->index = 8;
    Proc_Break(proc);
}
