#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "soundwrapper.h"

#include "constants/songs.h"

s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc * proc)
{
    int previous = proc->hoverUnitIdx;

    u16 keys = gKeyStatusPtr->repeatedKeys;

    proc->scrollAmount = 4;

    if (gKeyStatusPtr->heldKeys & L_BUTTON)
    {
        keys = gKeyStatusPtr->heldKeys;
        proc->scrollAmount = 8;
    }

    if (keys & DPAD_UP)
    {
        if ((proc->hoverUnitIdx - 3) >= 0)
        {
            proc->hoverUnitIdx -= 3;
        }
    }

    if (keys & DPAD_DOWN)
    {
        if ((proc->hoverUnitIdx + 3) < PrepGetUnitAmount())
        {
            proc->hoverUnitIdx += 3;
        }
    }

    if (keys & DPAD_LEFT)
    {
        if ((proc->hoverUnitIdx % 3) != 0)
        {
            proc->hoverUnitIdx--;
        }
    }

    if (keys & DPAD_RIGHT)
    {
        if (((proc->hoverUnitIdx % 3) < 2) && ((proc->hoverUnitIdx + 1) < PrepGetUnitAmount()))
        {
            proc->hoverUnitIdx++;
        }
    }

    if (proc->hoverUnitIdx != previous)
    {
        int hoverYPos = proc->hoverUnitIdx / 3 * 16;
        int yMax = (PrepGetUnitAmount() - 1) / 3 * 16;

        if (hoverYPos - proc->scrollOffset > 32 && proc->scrollOffset + 48 < yMax)
        {
            PrepItem_DrawUnitNameRow(proc, (proc->scrollOffset >> 4) + 4, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else if (hoverYPos - proc->scrollOffset < 0x10 && ({ proc->scrollOffset + 0; }) != 0)
        {
            PrepItem_DrawUnitNameRow(proc, (proc->scrollOffset >> 4) - 1, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else
        {
            ShowSysHandCursor(
                (proc->hoverUnitIdx % 3) * 64 + 24, (proc->hoverUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 7,
                0x40 * CHR_SIZE);
        }

        PlaySoundEffect(SONG_65);
        return 1;
    }

    return 0;
}
