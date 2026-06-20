#include "global.h"

#include "bmtrap.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "popup.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "soundwrapper.h"
#include "m4a.h"

extern struct ProcCmd sProcScr_ExecTrap8[];
extern struct ProcCmd sProcScr_ExecTrapMine[];

int ExecTrap(ProcPtr proc, struct Unit * unit, int exec_type)
{
    struct ProcBmTrap * proc2;

    switch (GetPickTrapType(unit)) {
        case TRAP_8:
            proc2 = Proc_StartBlocking(sProcScr_ExecTrap8, proc);
            proc2->post_exec_type = exec_type;
            proc2->unit = unit;
            break;

        case TRAP_MINE:
            RemoveTrap(GetTypedTrapAt(unit->xPos, unit->yPos, TRAP_MINE));
            proc2 = Proc_StartBlocking(sProcScr_ExecTrapMine, proc);
            proc2->post_exec_type = exec_type;
            proc2->unit = unit;
            break;

        case TRAP_FIRE_THIEF:
            RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
            PlaySoundEffect(SONG_B1);
            NewPopup2_PlanA(proc, -1, GetStringFromIndex(0x81B));

            break;

        case TRAP_MINE_ASSASSIN:
            RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
            PlaySoundEffect(SONG_B1);
            NewPopup2_PlanA(proc, -1, GetStringFromIndex(0x81C));
            UnitAddItem(unit, MakeNewItem(ITEM_MINE));
            break;
    }

    return 0;
}
