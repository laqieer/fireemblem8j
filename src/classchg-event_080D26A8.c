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

void PromoTrainee_Talk5(struct ProcPromoTraineeEvent *proc) {
    u8 i;

    const u32 msgs[3] = {
        -1,
        0xC4C,  /* [ToggleSmile]But I'm not about to stop.[NL]I'm just getting started![.][A][ToggleSmile] */
        0xC51   /* [ToggleSmile]Not until I've become a[.][NL]great sage, like my teacher.[A][ToggleSmile] */
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

    if (msgs[i] == (u32)-1) {
        Proc_Goto(proc, 3);
        return;
    }
    else {
        StartCgText(0x16, 0x12, 0x12, 4, msgs[i], OBJ_VRAM0 + 0x1800, -1, 0);
        SetCgTextFlags(CG_TEXT_FLAG_1 | CG_TEXT_FLAG_3);
    }
}
