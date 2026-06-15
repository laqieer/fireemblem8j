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

void ExecEkrHenseiEnd(void)
{
    AnimClearAll();
    NewEkrHenseiEnd();
    SetMainUpdateRoutine(MainUpdate_0);
}
