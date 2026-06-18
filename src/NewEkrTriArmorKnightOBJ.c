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


void NewEkrTriArmorKnightOBJ(struct Anim *anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2, * anim3;
    char * pal;
    u32 * scr;
    const u16 * img;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x14;
    pal = gBanimTriAtkPalettes[0];

    if (etype1 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype1)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_PAL(0x8) + OAM2_LAYER(0x2) + OAM2_CHR(0x0800 / 0x20);

    LZ77UnCompWram(pal, gBuf_Banim);
    CpuFastCopy(gBuf_Banim, PAL_OBJ(0x8), 0x20);
    LZ77UnCompWram(img, gBuf_Banim);

    pal = gBanimTriAtkPalettes[1];
    if (etype2 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype2)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim3 = anim2;
    anim2->oam2Base = OAM2_PAL(0xA) + OAM2_LAYER(0x2) + OAM2_CHR(0x1000 / 0x20);

    LZ77UnCompWram(pal, &gBuf_Banim[0x800]);
    CpuFastCopy(&gBuf_Banim[0x800], PAL_OBJ(0xA), 0x20);
    LZ77UnCompWram(img, &gBuf_Banim[0x800]);

{
    u16 * dst = OBJ_VRAM0 + 0x800;
    RegisterDataMove(gBuf_Banim, dst, 0x1000);
}
    EnablePaletteSync();

    proc->anim2->xPosition = proc->anim->xPosition + 0x20;
    proc->anim3->xPosition = proc->anim->xPosition - 0x20;
}
