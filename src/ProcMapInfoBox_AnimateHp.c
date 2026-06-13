#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void ProcMapInfoBox_AnimateHp(struct MAInfoFrameProc* proc)
{
    int updated = FALSE;
    int i;

    for (i = 0; i < gManimSt.actorCount; ++i) {
        u16 r4 = gManimSt.actor[i].hp_displayed_q4;

        if (r4 > gManimSt.actor[i].hp_cur*16)
            r4 = r4 - 16;

        if (r4 < gManimSt.actor[i].hp_cur*16) {
            r4 = r4 + 4;

            if (r4 % 16 == 0)
                PlaySoundEffect(SONG_75);
        }

        if (r4 != gManimSt.actor[i].hp_displayed_q4) {
            gManimSt.actor[i].hp_displayed_q4 = r4;
            MapInfoBox_DrawHp(proc, i);
            updated = TRUE;
        }
    }

    if (!updated && gManimSt.hp_changing)
        gManimSt.hp_changing = FALSE;
}
