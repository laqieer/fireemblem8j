#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

struct Proc8599FD4 {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};

void MapPaletteBrightnessFade_Loop(struct Proc8599FD4 *proc)
{
    int val = proc->unk44 + proc->unk48;

    proc->unk44 = val;

    WriteFadedPaletteFromArchive(
        (proc->unk2C * (0x100 - val) + proc->unk38 * val) / 0x100,
        (proc->unk30 * (0x100 - val) + proc->unk3C * val) / 0x100,
        (proc->unk34 * (0x100 - val) + proc->unk40 * val) / 0x100,
        proc->unk4C
    );

    if (proc->unk44 == 0x100)
        Proc_Break(proc);
}
