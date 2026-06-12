#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"

#include "constants/songs.h"

extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_0[];

extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_1[];

extern struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_2[];



/* file-scope type definitions used by this run */


struct Proc89A448C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
};

struct MAEffectSummonProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ u8 unk_38;
    /* 3A */ STRUCT_PAD(0x3a, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 unk_4a;
    /* 4C */ STRUCT_PAD(0x4c, 0x50);
    /* 50 */ struct MAEffectSummonProc * unk_50;
};

//! FE8U = 0x08080288
void MapEventcallFx2_RampToWhite(struct MAEffectProc * proc)
{
    int i;

    if (proc->timer == 0)
    {
        u16 amount = proc->frame * 4;

        if (proc->frame <= 7)
        {
            for (i = 1; i < 16; i++)
            {
                u16 r;
                u16 g;
                u16 b;
                u16 color = PAL_BG_COLOR(gMapanimEventcall_4[proc->unk44], i);

                r = amount + RED_VALUE(color);

                if (r > 31)
                {
                    r = 31;
                }

                g = amount + GREEN_VALUE(color);

                if (g > 31)
                {
                    g = 31;
                }

                b = amount + BLUE_VALUE(color);

                if (b > 31)
                {
                    b = 31;
                }

                PAL_BG_COLOR(gMapanimEventcall_4[proc->unk44], i) = RGB(r, g, b);
            }
        }
        else
        {
            SetBlendTargetA(0, 0, 0, 1, 1);
            SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 16);
            SetDispEnable(0, 0, 0, 1, 1);

            proc->frame = 0;
            Proc_Break(proc);

            return;
        }

        EnablePaletteSync();
        proc->frame++;
    }
    else
    {
        proc->timer--;
    }

    return;
}
