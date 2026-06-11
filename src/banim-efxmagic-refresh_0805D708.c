#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_SongBg[];
extern u16 * TsaArray_SongBg[];

//! FE8U = 0x0805C96C
void efxSong_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 39)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 139)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 179)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x0805CA64
void StartSubSpell_efxSongBG(struct Anim * anim, int kind)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  2,
         1,  2,
         2,  2,
         3,  2,
         4,  2,
         5,  2,
         6,  2,
         7,  2,
         8,  2,
         9,  2,
        10,  2,
        11,  2,
        12,  2,
        13,  2,
        14,  2,
        15,  2,
        16,  2,
        17,  2,
        18,  2,
        19,  2,
        20,  2,
        21,  2,
        22,  2,
        23,  2,
        24,  2,
        25,  2,
        26, 48,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_SongBg;
    proc->tsar = TsaArray_SongBg;

    proc->img = ImgArray_SongBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
