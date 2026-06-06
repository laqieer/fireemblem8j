#include "global.h"

#include "ctc.h"
#include "hardware.h"

#include "worldmap.h"

//! FE8U = 0x080BBA84
void GmapCursor_Init(struct GmapCursorProc * proc)
{
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->frameIdx = 0;
    proc->unk_3c = 0;
    proc->unk_38 = 0;
    proc->unk_44 = 0;
    proc->unk_40 = 0;

    proc->unk_48 = 0x300;

    proc->unk_34 = 0;
    proc->unk_35 = 4;

    PAL_OBJ_COLOR(4, 14) = *(gPal_WorldmapGmap_0 + 0);

    EnablePaletteSync();

    return;
}
