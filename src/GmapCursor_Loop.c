#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern const struct Unknown08206498 gWorldmapCursor_0[];

//! FE8U = 0x080BBAD4
void GmapCursor_Loop(struct GmapCursorProc * proc)
{
    proc->unk_32 = gGMData.sprite_disp;

    proc->unk_38 = gGMData.ix;
    proc->unk_3c = gGMData.iy;

    if (proc->unk_32 > 0)
    {
        u32 chr = proc->chr;
        const struct Unknown08206498 * ptr = &gWorldmapCursor_0[proc->frameIdx];

        s16 x;
        s16 y;
        *&x = proc->pScreenProc->x;
        *&y = proc->pScreenProc->y;

        PutSprite(
            4,
            (gGMData.ix >> 8) - x - ptr->x,
            (gGMData.iy >> 8) - y - ptr->y,
            ptr->pSpriteData,
            (chr / CHR_SIZE) + ptr->unk_00 + OAM2_PAL(proc->pal) + OAM2_LAYER(2)
        );

        proc->unk_35--;

        if (proc->unk_35 == 0)
        {
            proc->unk_34++;

            if (proc->unk_34 > 15)
            {
                proc->unk_34 = 0;
            }

            PAL_OBJ_COLOR(4, 14) = *(gPal_WorldmapGmap_0 + proc->unk_34);

            EnablePaletteSync();

            proc->unk_35 = 4;
        }

        proc->unk_40 = proc->unk_38;
        proc->unk_44 = proc->unk_3c;
    }

    return;
}
