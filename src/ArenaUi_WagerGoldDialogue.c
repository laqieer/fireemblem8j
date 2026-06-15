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

void SetTalkNumber(int n);
int ArenaGetMatchupGoldValue(void);
void StartArenaDialogue(int msgid, ProcPtr proc);

void ArenaUi_WagerGoldDialogue(ProcPtr proc) {
    SetTalkNumber(ArenaGetMatchupGoldValue());
    StartArenaDialogue(0x872, proc);
    return;
}
