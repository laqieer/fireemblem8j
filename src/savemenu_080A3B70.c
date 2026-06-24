#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "constants/songs.h"

/* JP-specific extras-menu wait loop (NOT the fe8u DPAD-picker of the same name).
 * Local extended proc struct: only the JP fields this loop touches are named;
 * the rest is opaque padding so we don't disturb savemenu.h. */
struct ProcSaveMenuExtrasJp
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad_29[0x3B - 0x29];
    /* 3B */ u8 ctrl_enabled;
    /* 3C */ u8 _pad_3C[0x4F - 0x3C];
    /* 4F */ s8 sel_x;
    /* 50 */ s8 sel_y;
    /* 51 */ u8 _pad_51[0x5E - 0x51];
    /* 5E */ u16 hold_timer;
};

void SaveMenuExtrasMenuLoop(struct ProcSaveMenuExtrasJp * proc)
{
    proc->sel_x = 0;
    proc->sel_y = 0;

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        ChangeBgm(SONG_MAIN_THEME, 0x100, 0xc0, 0x18, NULL);
        Proc_Goto(proc, 0);
        return;
    }

    if (gKeyStatusPtr->heldKeys & SELECT_BUTTON)
    {
        proc->hold_timer++;

        if (proc->ctrl_enabled != 0 && proc->hold_timer > 0xb4)
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Goto(proc, 3);
            return;
        }
    }
    else
    {
        proc->hold_timer = 0;
    }

    if (gKeyStatusPtr->newKeys & (L_BUTTON | DPAD_LEFT))
        proc->sel_x = -1;

    if (gKeyStatusPtr->newKeys & (R_BUTTON | DPAD_RIGHT))
        proc->sel_x = 1;

    if (proc->sel_x == 0 && proc->sel_y == 0)
        return;

    Proc_Goto(proc, 2);
}
