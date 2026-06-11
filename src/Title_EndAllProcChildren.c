#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080C63C4
void Title_EndAllProcChildren(ProcPtr proc) {
    EndAllProcChildren(proc);

    return;
}
