#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/items.h"
#include "constants/songs.h"

void EfxHpBar_WaitCameraMove(struct ProcEfxHpBar * proc)
{
    if (++proc->timer == (proc->cur - 4))
    {
        GetAnimAnotherSide(proc->anim_this);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }
    else if (proc->timer == proc->cur)
    {
        gEkrHpBarCount--;
        Proc_Break(proc);
    }
}
