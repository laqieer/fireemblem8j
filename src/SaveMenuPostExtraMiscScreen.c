#include "global.h"
#include "proc.h"
#include "savemenu.h"
#include "variables.h"
#include "functions.h"

//! FE8U = 0x080AA1BC
void SaveMenuPostExtraMiscScreen(struct SaveMenuProc * proc)
{
    switch (proc->extra_sel_bitfile) {
    case EXTRA_MENU_OPTION_MAP:
    case EXTRA_MENU_OPTION_BONUS_CLAIM:
        Proc_Goto(proc, PL_SAVEMENU_POST_BONUS_CLAIM);
        return;

    case EXTRA_MENU_OPTION_SUPPORT:
    case EXTRA_MENU_OPTION_SOUND_ROOM:
    case (1 << 3):
        Proc_Goto(proc, PL_SAVEMENU_10);
        return;
    }
}
