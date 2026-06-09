#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "worldmap.h"

/* prototypes for same-file helpers called by this run */
void WmMinimap_PutCursorIcon(struct GMapRadarProc * proc);
void WmMinimap_PutStoryNodeIcon(struct GMapRadarProc * proc);
void WmMinimap_PutLordIcon(struct GMapRadarProc * proc);
void WmMinimap_PutSkirmishIcons(struct GMapRadarProc * proc);
void WmMinimap_BlinkPalette(struct GMapRadarProc * proc);

//! FE8U = 0x080C3A64
void PutWmMinimapSprites(struct GMapRadarProc * proc)
{
    WmMinimap_PutStoryNodeIcon(proc);
    WmMinimap_PutSkirmishIcons(proc);
    WmMinimap_PutLordIcon(proc);
    WmMinimap_PutCursorIcon(proc);

    WmMinimap_BlinkPalette(proc);

    return;
}
