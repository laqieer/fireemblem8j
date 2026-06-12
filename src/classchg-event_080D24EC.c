#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

void PromoTrainee_Talk1(struct ProcPromoTraineeEvent *proc)
{
    struct FaceProc *b, *c, *d;
    u8 i;

    const u32 msgs[3] = { 
        0xC44,  /* [ToggleSmile]Wow... Would you look at[NL]these muscles![A][ToggleSmile] */
        0xC48,  /* [ToggleSmile]I'm ready to fight now![.][A][ToggleSmile] */
        0xC4D   /* [ToggleSmile]Oh, my... Look at this![.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }
    StartTalkFace(proc->face, 0xd4, 0x50, 0x82, 0);

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);

    gFaces[0]->displayBits = FACE_DISP_KIND(2) | FACE_DISP_HLAYER(2);
    b = gFaces[1];
    c = gFaces[2];
    d = gFaces[3];
    d->displayBits = FACE_DISP_HIDDEN;
    c->displayBits = FACE_DISP_HIDDEN;
    b->displayBits = FACE_DISP_HIDDEN;

    gUnk_80 = -1;
}
