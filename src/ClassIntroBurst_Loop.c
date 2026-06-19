#include "global.h"
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



void PutClassIntroBurstSprites(struct OpInfoBurstProc* proc, int b, int c, int d);

void ClassIntroBurst_Loop(struct OpInfoBurstProc* proc) {
    int scale;

    if (proc->unk_64 < 71) {
        scale = Interpolate(4, 0x120, 0x10, proc->unk_64, 70);

        SetObjAffine(
            11,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_64++;
    }

    PutClassIntroBurstSprites(proc, 11, 215, 17);

    if (proc->unk_66 < 71) {
        scale = Interpolate(0, 0x120, 0x10, proc->unk_66, 70);

        SetObjAffine(
            12,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_66++;
    }

    PutClassIntroBurstSprites(proc, 12, 192, 32);

    if (proc->unk_68 < 71) {
        scale = Interpolate(1, 0x120, 0x10, proc->unk_68, 70);

        SetObjAffine(
            13,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_68++;
    }

    PutClassIntroBurstSprites(proc, 13, 169, 47);

    proc->unk_4c++;

    if (proc->unk_68 > 70) {
        Proc_Break(proc);
    }

    return;
}
