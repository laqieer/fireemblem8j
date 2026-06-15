#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "ctc.h"
#include "proc.h"

void StartArenaDialogue(int msgid, ProcPtr proc);

void ArenaUi_GoodLuckDialogue(ProcPtr proc) {
    StartArenaDialogue(0x873, proc);
    return;
}
