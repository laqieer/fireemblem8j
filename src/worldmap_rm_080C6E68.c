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



/* prototypes for same-file helpers called by this run */
void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc);

void GmapRm_InitBlend(struct ProcGmapRm * proc)
{
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetBlendConfig(1, 0x10, 0, 0);

    SetDispEnable(1, 1, 1, 1, 1);
    proc->timer = 0;
}

void GmapRm_BlendIn(struct ProcGmapRm * proc)
{
    if (++proc->timer < 75)
    {
        u16 val = (proc->timer * 0x10) / 75;
        SetBlendConfig(1, val, 0x10 - val, 0);
    }
    else
    {
        Proc_Break(proc);
    }
}

void GmapRm_0(struct ProcGmapRm * proc)
{
    Decompress(Img_GmapPath, (void *)BG_VRAM + 0x5000);
    GM_SCREEN->gmroute->flags |= GM_ROUTE_FLAG_2;
    GM_SCREEN->gmroute->flags |= GM_ROUTE_FLAG_0 | GM_ROUTE_FLAG_1;

    SkipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(1, 0x10, 0, 0);
    GmapRm_DisplayLeaderUnit(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetDispEnable(1, 1, 1, 1, 1);

    gGMData.state.bits.state_3 = 0;
    SetupGmapNodeGfx();
    LoadObjUIGfx();
    proc->timer = 0;
}
