#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrlevelup.h"
#include "ekrclasschg.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"
#include "eventinfo.h"
#include "constants/songs.h"







































































































void ekrBattlePrepareDragonIntro(struct ProcEkrBattle *proc)
{
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattleExecDragonIntro;
}
