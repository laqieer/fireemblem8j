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

//! FE8U = 0x080AB77C
void EndSaveBgFog(void) {
    Proc_EndEach(gProcScr_Savedraw_0);
    SetPrimaryHBlankHandler(NULL);
    return;
}
