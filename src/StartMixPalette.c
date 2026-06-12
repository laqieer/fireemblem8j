#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_MixPalette[];

void StartMixPalette(u16 * palA, u16 * palB, int speed, int targetPalId, int palCount, ProcPtr parent)
{
    struct ProcMixPalette * proc = Proc_Start(ProcScr_MixPalette, parent);

    proc->speed = speed;
    proc->targetPalId = targetPalId;
    proc->palCount = palCount;

    proc->srcA = palA;
    proc->srcB = palB;
}
