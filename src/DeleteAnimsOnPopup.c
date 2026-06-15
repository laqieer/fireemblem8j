#include "global.h"
#include "proc.h"
#include "ekrbattle.h"
#include "anime.h"

extern ProcPtr gpProcEkrPopup;

void DeleteAnimsOnPopup(void)
{
    if (gpProcEkrPopup != NULL) {
        Proc_End(gpProcEkrPopup);
        gpProcEkrPopup = NULL;
    }
}
