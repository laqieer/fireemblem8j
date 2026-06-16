#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"

void EndEkrBattleDeamon(void);
void OnMain(void);
void OnVBlank(void);
void EkrHenseiEnd_End(struct ProcEkrHensei *proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();
    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);
    Proc_Break(proc);
}
