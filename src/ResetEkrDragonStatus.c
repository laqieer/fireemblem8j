#include "global.h"
#include "gbafe.h"





void ResetEkrDragonStatus(void)
{
    struct EkrDragonStatus *dstat;

    dstat = &gEkrDragonStatusLeft;
    dstat->type = 0;
    dstat->unk01 = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;

    dstat = &gEkrDragonStatusRight;
    dstat->type = 0;
    dstat->unk01 = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;
}

