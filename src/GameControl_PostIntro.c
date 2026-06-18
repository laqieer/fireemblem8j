#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/chapters.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

void GameControl_PostIntro(struct GameCtrlProc * proc)
{
    int tmp;

    switch (proc->nextAction) {
    case GAME_ACTION_USR_SKIPPED:
        Proc_Goto(proc, 3); /* JP label = US LGAMECTRL_TITLE_DIRECT(4) - 1 */
        break;

    case GAME_ACTION_EVENT_RETURN:
        Proc_Goto(proc, 4); /* JP label = US LGAMECTRL_EXEC_SAVEMENU(5) - 1 */
        GameControl_FadeBgmVolume(proc);
        break;

    case GAME_ACTION_CLASS_REEL:
        tmp = proc->idle_status;
        switch (tmp & 1) {
        case 0:
            Proc_Goto(proc, 1); /* JP label = US LGAMECTRL_CLASS_REEL(2) - 1 */
            break;

        case 1:
            Proc_Goto(proc, 0); /* JP label = US LGAMECTRL_OP_ANIM(1) - 1 */
            break;
        }

        proc->idle_status++;
        break;

    case GAME_ACTION_PLAYED_THROUGH:
        Proc_Goto(proc, 23); /* JP label = US 24 - 1 */
        break;
    }
}
