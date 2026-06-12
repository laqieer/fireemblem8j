#include "global.h"
#include "classchg.h"
#include "bm.h"
#include "bmio.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "sysutil.h"
#include "constants/songs.h"

struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_PromoMain, proc);
}
