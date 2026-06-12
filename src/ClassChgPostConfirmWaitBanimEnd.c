#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "bmbattle.h"
#include "bm.h"
#include "hardware.h"
#include "bmusemind.h"
#include "ap.h"
#include "soundwrapper.h"
#include "cgtext.h"
#include "sysutil.h"

void ClassChgPostConfirmWaitBanimEnd(struct ProcClassChgPostConfirm *proc)
{
    int game_lock = proc->game_lock;
    if (game_lock == GetGameLock())
        Proc_Break(proc);
}
