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

void PromoTrainee_Talk3(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC06,  /* [ToggleSmile]Why, I bet I could take on my[.][NL]dad or just about anyone![.][A][ToggleSmile] */
        0xC0A,  /* [ToggleSmile]But now, it's no problem![.][NL]I've come a long way.[.][A][ToggleSmile] */
        0xC0F   /* [ToggleSmile]I've turned a corner in my[NL]education. I'm a real mage![.][A][ToggleSmile] */
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
