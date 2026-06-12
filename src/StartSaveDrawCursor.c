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
extern struct ProcCmd gProcScr_SaveDrawCursor[];

//! FE8U = 0x080AB534
struct SaveMenuCursorProc* StartSaveDrawCursor(ProcPtr parent)
{
    return Proc_Start(gProcScr_SaveDrawCursor, parent);
}
