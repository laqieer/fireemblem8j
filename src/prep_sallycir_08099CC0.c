#include "global.h"

#include "fontgrp.h"
#include "hardware.h"

#include "prepscreen.h"

//! FE8U = 0x080979DC
void SallyCir_Loop(struct SallyCirProc * proc)
{
    s16 i;

    proc->unk_2c += proc->unk_2a;

    if (proc->unk_2c > 150) {
        proc->unk_2c = 150;
    }

    if (proc->unk_2c < 0) {
        proc->unk_2c = 0;
    }

    for (i = 0; i < 160; i++) {
        s16 distance;
        int var;
        if (proc->unk_2c < 1
            || (var = (proc->unk_2c * proc->unk_2c) - ((i - 80) * (i - 80))) < 0) {
            gPrepscreen_4[1][i].left = 120;
            gPrepscreen_4[1][i].right = 120;
            continue;
        }

        distance = Sqrt(var);
        if (distance > 120) {
            distance = 120;
        }

        gPrepscreen_4[1][i].left = 120 - distance;
        gPrepscreen_4[1][i].right = distance + 120;
    }

    proc->unk_29++;

    if (proc->unk_29 == 40) {
        Proc_Break(proc);
    }

    return;
}
