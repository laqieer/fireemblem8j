#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805AA28
void EndEkrUnitMainMini(struct AnimBuffer * pAnimBuf)
{
    AnimDelete(pAnimBuf->anim1);
    AnimDelete(pAnimBuf->anim2);

    pAnimBuf->anim1 = 0;
    pAnimBuf->anim2 = 0;

    Proc_End(pAnimBuf->unk_34);

    return;
}
