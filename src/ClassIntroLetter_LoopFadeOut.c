#include "global.h"

#include <stdio.h>
#include <string.h>

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"

void PutClassNameIntroLetter(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset);

struct OpInfoEnterProcJ {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 classNameLength;

    /* 2F */ u8 _pad1[0x34-0x2F];

    /* 34 */ ProcPtr letterProcsPtr[1];
};

//! FE8U = 0x080B7BE8
void ClassIntroLetter_LoopFadeOut(struct OpInfoViewProc* proc) {
    u32 a4 = 0x100 + proc->timer;
    u32 a5 = 0x100 - proc->timer;

    PutClassNameIntroLetter(
        proc->charIndex,
        proc->unk_2e,
        0x18,
        a4,
        a5,
        ({proc->timer + 0;}) / 16
    );

    if (proc->timer == 0x100) {
        ((struct OpInfoEnterProcJ*)(proc->proc_parent))->letterProcsPtr[proc->charIndex] = NULL;

        Proc_Break(proc);
    }

    proc->timer += 8;

    return;
}
