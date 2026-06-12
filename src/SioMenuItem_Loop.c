#include "global.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u16 gSioUiutils_0[];

//! FE8U = 0x0804C5F8
void SioMenuItem_Loop(struct SioMenuItemProc * proc)
{
    int oam2 = OAM2_CHR(0x2C8) + OAM2_PAL(8);

    PutSprite(4, proc->xBase, proc->yBase, SpriteArray_SioMenuItems[proc->index], gSioUiutils_0[proc->state]);

    if (proc->state == 2)
    {
        UpdateSioMenuSelectedGlow(proc->glowFrame);
    }

    proc->glowFrame = (proc->glowFrame + 1) & 31;

    if (proc->state == 2 && proc->index == 1)
    {
        proc->leftArrowAnmCnt += proc->leftArrowSpeed;
        proc->rightArrowAnmCnt += proc->rightArrowSpeed;

        if (proc->leftArrowSpeed > 4)
        {
            proc->leftArrowSpeed--;
        }

        if (proc->rightArrowSpeed > 4)
        {
            proc->rightArrowSpeed--;
        }

        if ((GetGameClock() & 3) == 0)
        {
            if (proc->xLeftArrow < 0)
            {
                proc->xLeftArrow++;
            }

            if (proc->xRightArrow > 52)
            {
                proc->xRightArrow--;
            }
        }

        // Put golden arrow sprites for increasing/decreasing team count

        PutSprite(0, 75 + proc->xBase + proc->xLeftArrow, proc->yBase + 8, gObject_8x16, ((proc->leftArrowAnmCnt >> 5) % 6) + oam2);
        PutSprite(
            0, 73 + proc->xBase + proc->xRightArrow, proc->yBase + 8, gObject_8x16_HFlipped,
            ((proc->rightArrowAnmCnt >> 5) % 6) + oam2);

        PutSpriteExt(0, 80 + proc->xBase, proc->yBase + 9, SpriteArray_SioMenuTeamCount[gLinkArenaSt.unk_05], 0);
    }

    return;
}
