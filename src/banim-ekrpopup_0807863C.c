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

void ekrPopup_MarkEnd(struct ProcEkrPopup *proc)
{
    if (++proc->timer > 0x10) {
        gEkrPopupEnded = true;
        Sound_SetSEVolume(0x100);
        Proc_Break(proc);
    }
}
