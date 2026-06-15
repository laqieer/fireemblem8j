#include "global.h"
extern struct ProcCmd gProcScr_CgTextMain[];
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

//! FE8U = 0x0808F270
void EndCgText(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextMain));
    return;
}
