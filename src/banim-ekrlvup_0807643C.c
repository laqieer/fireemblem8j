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

void EkrLvup_PrepareApGfx(struct ProcEkrLevelup *proc)
{
    int i;

    NewEkrLvupApfx(0xA0, 1);

    for (i = 0; i < 8; i++)
        gEkrlvup_0[i] = 0;
    
    Proc_Break(proc);
}
