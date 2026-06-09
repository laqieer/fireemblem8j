#include "global.h"

#include "bmbattle.h"
#include "event.h"
#include "eventinfo.h"

//! FE8U = 0x08084634
bool CheckFlag82(void)
{
    if (CheckFlag(0x82))
        return true;

    return false;
}

//! FE8U = 0x0808464C
struct BattleTalkExtEnt* GetBattleQuoteEntry(u16 pidA, u16 pidB) {
    struct BattleTalkExtEnt* it;

    for (it = gBattleTalkList; it->pidA != 0xFFFF; it++) {

        if (it->chapter != 0xff && it->chapter != gPlaySt.chapterIndex) {
            if (it->chapter != 0xfe || BattleIsTriangleAttack() != 1) {
                continue;
            }
        }

        if (GetEventTriggerState(it->flag)) {
            continue;
        }

        if (it->pidA != 0) {

            if (it->pidB == 0) {
                if (pidA == it->pidA) {
                    return it;
                }
                continue;
            }

        } else {
            if (it->pidB == 0) {
                continue;
            }

            if (pidB == it->pidB) {
                return it;
            }

            continue;
        }

        if ((pidA == it->pidA) && (pidB == it->pidB)) {
            return it;
        }

        if ((pidB == it->pidA) && (pidA == it->pidB)) {
            return it;
        }


    }

    return NULL;
}

//! FE8U = 0x080846E4
struct DefeatTalkEnt* GetDefeatTalkEntry(u16 pid) {
    struct DefeatTalkEnt* it;

    for (it = gDefeatTalkList; it->pid != 0xFFFF; it++) {
        if ((it->route != 0xff) && (it->route != gPlaySt.chapterModeIndex)) {
            continue;
        }

        if ((it->chapter != 0xff) && (it->chapter != gPlaySt.chapterIndex)) {
            continue;
        }

        if (GetEventTriggerState(it->flag) != 0) {
            continue;
        }

        if (pid != it->pid) {
            continue;
        }

        return it;
    }

    return NULL;
}
