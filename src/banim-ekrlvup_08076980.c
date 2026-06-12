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

void EkrLvup_OnEnd(struct ProcEkrLevelup *proc)
{
    Proc_End(gpProcEfxPartsofScroll);
    Proc_End(gpProcEfxleveluphb);

    EnableEfxStatusUnits(proc->ais_main);
    EnableEfxStatusUnits(proc->ais_core);
    EnableEfxWeaponIcon();
    EnableEfxHpBarColorChange();
    proc->finished = true;
}
