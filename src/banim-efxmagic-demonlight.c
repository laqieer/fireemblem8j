#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08066C1C
void efxMaohFlashBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    u16 palBuffer[0x10];

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CopyPalWithFade(Pal_Ekrdragonfx_2, palBuffer, ret - 4);
        SpellFx_RegisterBgPal(palBuffer, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08066C74
int efxMaohFlash_GetSideXOffset(int pos)
{
    int xNew;

    if (gEkrDistanceType == 0)
    {
        xNew = 24;
    }
    else
    {
        xNew = 0;
    }

    if (pos == 0)
    {
        xNew = -xNew;
    }

    return xNew;
}

//! FE8U = 0x08066C98
void efxMaohFlash_RegisterSpritesGfx(void)
{
    SpellFx_RegisterObjPal(Pal_DemonLightSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites, 32 * 4 * CHR_SIZE);
    return;
}
