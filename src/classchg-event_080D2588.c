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

void PromoTrainee_Talk2(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC45,  /* [ToggleSmile]I had no idea how much[NL]stronger I'd gotten...[A][ToggleSmile] */
        0xC49,  /* [ToggleSmile]This armor used to be too[.][NL]heavy for me to wear...[.][A][ToggleSmile] */
        0xC4E   /* [ToggleSmile]Magic used to seem so hard,[.][NL]but I...I think I've got it.[A][ToggleSmile] */
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

    StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
}
