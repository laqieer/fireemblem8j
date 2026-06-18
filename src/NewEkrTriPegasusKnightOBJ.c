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

void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEfxOBJ * proc;
    char * pal;
    u32 * scr;
    const u16 * img;

    proc = Proc_Start(ProcScr_EkrTriPegasusKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (pos == EKR_POS_L)
    {
        proc->terminator = 0x12;
        pal = gBanimTriAtkPalettes[EKR_POS_L];
        scr = AnimScr_TriAtkLeft;
    }
    else
    {
        proc->terminator = 0x11;
        pal = gBanimTriAtkPalettes[EKR_POS_R];
        scr = AnimScr_TriAtkRight;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);

    img = Img_TriPegasusKnightOBJ;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordOBJ;

        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceOBJ;
    }

    SpellFx_RegisterObjGfx(img, 0x1000);
}
