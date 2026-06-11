#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

bool GmapRm_GetPosition(s16 * px, s16 * py)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
    {
        *px = proc->x;
        *py = proc->y;
        return true;
    }
    return false;
}

void GmapRm_SetUnblocked(void)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
        proc->flag |= GMAPRM_FLAG_UNBLOCK;
}

void GmapRm_EndAll(void)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
    {
        SkipGmNodeIconDisplay(GM_ICON);
        SetBlendConfig(0, 0x10, 0x10, 0);
        GmapRm_DisplayLeaderUnit(proc);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 3;
        gLCDControlBuffer.bg3cnt.priority = 3;

        gGMData.state.bits.state_3 = 0;

        SetDispEnable(0, 0, 0, 0, 0);
        Proc_EndEach(ProcScr_GmapRmUpdateDirect);
        Proc_End(proc);
    }
}
