#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

void SupportSubScreen_DrawScrolledTilemaps(u32 xBase);

//! FE8U = 0x080A286C
void SupportSubScreen_SwapPageIn_FromRight(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (8 - b) * 8;

    SupportSubScreen_DrawScrolledTilemaps(b - 8);
    SetBlendConfig(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
    }

    return;
}
