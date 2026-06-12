#include "global.h"
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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_CgTextInterpreter[];

// clang-format on

//! FE8U = 0x0808FFC4
void RestartCgTextInterpreter(struct CgTextMainProc * parent)
{
    Proc_End(Proc_Find(gProcScr_CgTextInterpreter));
    Proc_Start(gProcScr_CgTextInterpreter, parent);
    return;
}
