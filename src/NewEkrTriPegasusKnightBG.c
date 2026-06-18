#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    char * pal;
    const u16 * img;
    struct ProcEkrTriPegasusKnightBG * proc;
    proc = Proc_Start(ProcScr_ekrTriPegasusKnightBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (pos == EKR_POS_L)
    {
        pal = gBanimTriAtkPalettes[EKR_POS_L];
        proc->frame_config = FrameLut_EkrTriPegagusBGLeft;
    }
    else
    {
        pal = gBanimTriAtkPalettes[EKR_POS_R];
        proc->frame_config = FrameLut_EkrTriPegagusBGRight;
    }

    proc->tsalut_left = TsaLut_EkrTriPegagusBG;
    proc->tsalut_right = TsaLut_EkrTriPegagusBG;

    LZ77UnCompWram(pal, gSpellAnimBgfx);
    SpellFx_RegisterBgPal((u16 *)gSpellAnimBgfx, 0x20);

    img = Img_TriPegasusKnightBG;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordBG;

        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceBG;
    }

    SpellFx_RegisterBgGfx(img, 0x2000);
}
