#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"




void efxQuakePure_Loop(struct ProcEfxQuake * proc)
{
    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] != INT16_MAX)
    {
        SetEkrBg2QuakeVec(vec[proc->timer * 2 + 0], vec[proc->timer * 2 + 1]);
        proc->timer++;
    }
    else
    {
        switch (proc->kind) {
        case 0:
            proc->timer = 0;
            SetEkrBg2QuakeVec(vec[0], vec[1]);
            break;

        case 1:
            SetEkrBg2QuakeVec(0, 0);
            break;
        }
    }
}
