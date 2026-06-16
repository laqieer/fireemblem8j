#include "global.h"
#include "hardware.h"
#include "bmfx.h"
#include "soundwrapper.h"
#include "constants/songs.h"

extern struct ProcCmd sProcScr_StatusHealEffect[];

void StartStatusHealEffect(struct Unit* unit, ProcPtr proc) {
    gActiveUnit = unit;

    if (proc) {
        Proc_StartBlocking(sProcScr_StatusHealEffect, proc);
        PlaySoundEffect(SONG_AA);
        return;
    }

    Proc_StartBlocking(sProcScr_StatusHealEffect, PROC_TREE_3);
    return;
}
