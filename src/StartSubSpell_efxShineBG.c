#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ctc.h"
#include "ekrclasschg.h"

extern struct ProcCmd ProcScr_efxShineBG[];
extern u16 * TsaArray_ShineBg_Left[];
extern u16 * TsaArray_ShineBg_Right[];
extern u16 * ImgArray_ShineBg[];

extern const u16 Frames_efxShineBG[];

void StartSubSpell_efxShineBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = Frames_efxShineBG;

    proc->tsal = TsaArray_ShineBg_Left;
    proc->tsar = TsaArray_ShineBg_Right;
    proc->img = ImgArray_ShineBg;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
