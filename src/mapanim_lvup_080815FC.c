#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "ap.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void ManimLevelUpLabelColor_Loop(struct ManimLevelUpLabelColorProc *proc)
{
    int new_color_offset;

    u16 *colors = Pal_ManimLevelUpStatGainCycling;

    proc->clock++;

    if ((proc->clock % 4) != 0)
        return;

    new_color_offset = (proc->clock >> 2) & 0xF;

    // TODO: constants
    CopyToPaletteBuffer(colors + new_color_offset + 0x00, (0x10 + proc->pal + 0) * 0x20 + 0x12, 0x20 - 0x12);
    CopyToPaletteBuffer(colors + new_color_offset + 0x20, (0x10 + proc->pal + 1) * 0x20 + 0x12, 0x20 - 0x12);
}
