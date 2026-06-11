#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxLiveBG[];
extern const u16 gEfxmagicHealstaves_0[];
extern const u16 gEfxmagicHealstaves_1[];
extern const u16 gEfxmagicHealstaves_2[];
extern const u16 gEfxmagicHealstaves_3[];

// clang-format on

//! FE8U = 0x08061594
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (kind)
    {
        case 0:
            proc->unk29 = 1;
            proc->frame_config = gEfxmagicHealstaves_0;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    BG_SetPosition(BG_1, 24, 0);
                }
                else
                {
                    BG_SetPosition(BG_1, 232, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->unk29 = 1;
            proc->frame_config = gEfxmagicHealstaves_2;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061650
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    proc->unk29 = 0;

    switch (kind)
    {
        case 0:
            proc->frame_config = gEfxmagicHealstaves_1;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    BG_SetPosition(BG_1, 232, 0);
                }
                else
                {
                    BG_SetPosition(BG_1, 24, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->frame_config = gEfxmagicHealstaves_3;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}
