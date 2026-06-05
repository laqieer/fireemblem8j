#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

/**
 * Generate random monsters on the worldmap
 */





ProcPtr NewGmapTimeMons(ProcPtr parent, int * out)
{
    struct ProcGmapTimeMons * proc;
    if (!parent)
        proc = Proc_Start(ProcScr_GmapTimeMons, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(ProcScr_GmapTimeMons, parent);

    if (out)
        *out = proc->monster_amt;

    return proc;
}

void WmRemoveRandomMonsters(void)
{
    int i;

    Proc_EndEach(ProcScr_GmapTimeMons);

    for (i = 0; i < WM_MONS_AMT; i++)
        GmMu_RemoveUnit(GM_MU, i + WM_MONS_UID_ENTRY);
}

void WmMergeMonsters(void)
{
    struct ProcGmapTimeMons * proc;
    proc = Proc_Find(ProcScr_GmapTimeMons);
    if (proc)
        proc->trigger = true;
}

void WmShowMonsters(void)
{
    int i;

    s16 x, y;

    for (i = WM_MONS_UID_ENTRY; i < WM_MONS_UID_ENTRY + WM_MONS_AMT; i++)
    {
        if (gGMData.units[i].id == 0)
            continue;

        if (gGMData.units[i].state & GM_UNIT_STATE_B1)
        {
            MapMU_SetUnitClass(
                GM_MU,
                i,
                !(gGMData.units[i].state & GM_UNIT_STATE_B1) ? 0 : gGMData.units[i].id,
                -1,
                gGMData.units[i].location);
        }
        else
        {
            MapMU_SetUnitChar(
                GM_MU,
                i,
                (gGMData.units[i].state & GM_UNIT_STATE_B1) ? 0 : gGMData.units[i].id,
                -1,
                gGMData.units[i].location);
        }

        *&x = gWMNodeData[gGMData.units[i].location].x;
        *&y = gWMNodeData[gGMData.units[i].location].y;

        GmMu_SetPosition(GM_MU, i, x, y);
        GmShowMuUnit(GM_MU, i);
    }
}

bool GmapTimeMonsExists(void)
{
    return Proc_Find(ProcScr_GmapTimeMons) != NULL;
}
