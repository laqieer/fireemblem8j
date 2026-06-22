#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ap.h"
#include "uisupport.h"
#include "savemenu.h"

extern u8 data_08A95548[];

void sub_80B4B34(struct SaveMenuProc * proc);
void sub_80B62A8(struct SaveMenuProc * proc);
void sub_80AEB98(struct SaveMenuProc * proc);

void sub_80AEBAC(struct SaveMenuProc * proc)
{
    proc->main_sel_bitfile = MAIN_MENU_OPTION_EXTRAS;

    Proc_End(proc->savedraw);

    SetPrimaryHBlankHandler(0);

    if (proc->approc != 0)
        APProc_Delete(proc->approc);

    switch (proc->extra_sel_bitfile) {
    default:
        return;

    case EXTRA_MENU_OPTION_6:
        sub_80AEB98(proc);
        return;

    case EXTRA_MENU_OPTION_BONUS_CLAIM:
        sub_80B62A8(proc);
        return;

    case EXTRA_MENU_OPTION_SOUND_ROOM:
        sub_80B4B34(proc);
        return;

    case EXTRA_MENU_OPTION_SUPPORT:
        StartSupportScreen(proc);
        return;

    case 8:
        Proc_StartBlocking((const struct ProcCmd *)data_08A95548, proc);
        return;
    }
}
