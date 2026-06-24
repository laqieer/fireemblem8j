#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"

#include "worldmap.h"

struct Unknown8A3E9A0
{
    /* 00 */ u16 * sprite;
    /* 04 */ u8 oam2;
    /* 05 */ s8 xOam1;
    /* 06 */ s8 yOam0;
    STRUCT_PAD(0x07, 0x08);
};

extern struct Unknown8A3E9A0 gWorldmapEffect_0[];

//! FE8U = 0x080C119C
void GmapEffect_0(struct GmapEffectProc * proc)
{
    s16 xOam1;
    s16 yOam0;
    struct Unknown8A3E9A0 * ptr;
    int layer;
    int i;
    s16 x;
    s16 y;

    if (gGMData.state.bits.state_3)
    {
        GmapRm_GetPosition(&x, &y);
    }
    else
    {
        x = gGMData.xCamera;
        y = gGMData.yCamera;
    }

    for (i = 0; i < 4; i++)
    {
        ptr = gWorldmapEffect_0 + (u8)proc->unk_2a * 4 + i;

        xOam1 = proc->unk_2c + ptr->xOam1 - x;
        yOam0 = proc->unk_2e + ptr->yOam0 - y;
        if (((xOam1 + 0x21) > 0 && (xOam1 + 0x21) < 0x112) && ((yOam0 + 0x21) > 0 && (yOam0 + 0x21) < 0xc2))
        {
            int oam2Layer;
            if (gGMData.state.bits.state_3)
            {
                layer = 0xc;
                oam2Layer = OAM2_LAYER(3);
            }
            else
            {
                layer = 0xd;
                oam2Layer = OAM2_LAYER(2);
            }

            PutSprite(layer, xOam1, yOam0, ptr->sprite, ptr->oam2 + OAM2_CHR(0x180) + OAM2_PAL(6) + oam2Layer);
        }
    }

    return;
}
