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


void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEkrTriArmorKnightOBJ2 * proc;
    struct Anim * anim2, *_anim;
    char * pal;
    u32 * scr;
    const u16 * buf;
    int off;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x5;
    proc->unk29 = pos;
    proc->unk2A = etype;

    if (pos == 0)
        pal = gBanimTriAtkPalettes[EKR_POS_L];
    else
        pal = gBanimTriAtkPalettes[EKR_POS_R];

    if (etype == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightAtkOBJ;
        buf = Img_TriKnightAtkOBJ;
    }
    else
    {
        switch (ewtype)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceAtkOBJ;
            buf = Img_TriGenerialLanceAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeAtkOBJ;
            buf = Img_TriGenerialAxeAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeAtkOBJ;
            buf = Img_TriGenerialHandAxeAtkOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;

    if (pos == 0)
    {
        anim2->yPosition += 0xA;
        proc->anim2->drawLayerPriority = 0x78;
        AnimSort();

        _anim = proc->anim;
        proc->unk32 = _anim->xPosition + 0x10;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }
    else
    {
        anim2->yPosition += 0x2;
        proc->anim2->drawLayerPriority = 0x14;
        AnimSort();

        _anim = proc->anim;
        proc->unk32 = _anim->xPosition - 0x0C;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }

    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);
    SpellFx_RegisterObjGfx(buf, 0x1000);
}
