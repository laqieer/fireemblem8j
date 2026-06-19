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

void PromoTrainee_Talk4(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xC07,  /* [ToggleSmile]I knew if I worked at it, I'd[.][NL]become a great warrior![.][A][ToggleSmile] */
        0xC0B,  /* [ToggleSmile]That's right. I'm a real[NL]soldier now![A][ToggleSmile] */
        0xC10   /* [ToggleSmile]But I'm not going to stop[.][NL]studying...[.][A][ToggleSmile] */
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
