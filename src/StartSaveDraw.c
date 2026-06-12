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
extern struct ProcCmd ProcScr_savedraw[];

// clang-format on

//! FE8U = 0x080AB300
struct SaveDrawProc * StartSaveDraw(ProcPtr parent)
{
    return Proc_Start(ProcScr_savedraw, parent);
}
