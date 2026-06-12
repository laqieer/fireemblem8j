#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_Savedraw_0[];

//! FE8U = 0x080AB760
void StartSaveBgFog(void* unused) {
    Proc_Start(gProcScr_Savedraw_0, PROC_TREE_3);
    StartBgVerticalScroll(EWRAM_ENTRY);
    return;
}
