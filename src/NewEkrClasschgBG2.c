#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

void NewEkrClasschgBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_Ekrclasschg_1;
    proc->tsal = TsaLut_Ekrclasschg_0;
    proc->tsar = TsaLut_Ekrclasschg_0;
    proc->img = ImgLut_Ekrclasschg_0;
    proc->pal = PalLut_Ekrclasschg_0;

    SpellFx_SetSomeColorEffect();
}
