#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

/**
 * Misc banim effects
 */



void NewEfxChillEffectBG(struct Anim *anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxChillEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBG;
    proc->tsal = TsaLut_EfxChillEffectBG;
    proc->tsar = TsaLut_EfxChillEffectBG;
    SpellFx_RegisterBgGfx(Img_ExcaliburBg2, 0x2000);
    BG_SetPosition(BG_1, 0x0, 0x0);
}

void EfxChillEffectBGMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxChillEffectBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxChillEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBGCOL;
    proc->pal = Pal_EfxChillEffectBG;
}
