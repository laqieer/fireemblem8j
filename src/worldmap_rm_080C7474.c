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



ProcPtr StartGmapRmBaPalAnim1(ProcPtr parent)
{
    ProcPtr proc;
    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_GmapRmBaPalAnim1, parent);
    else
        proc = Proc_Start(ProcScr_GmapRmBaPalAnim1, PROC_TREE_3);

    return proc;
}

void EndGmapRmBaPalAnim1(void)
{
    Proc_EndEach(ProcScr_GmapRmBaPalAnim1);
}

bool CheckGmapRmBaPalAnim1Exists(void)
{
    return (Proc_Find(ProcScr_GmapRmBaPalAnim1) != NULL) ? true : false;
}

bool CheckGmapRmBaPalAnim1State(void)
{
    struct ProcGmapRmBaPalAnim * proc;
    proc = Proc_Find(ProcScr_GmapRmBaPalAnim1);
    if (proc)
        return proc->flag;

    return 0;
}

void GmapRmBorder1_End(struct ProcGmapRmBorder1 * proc)
{
    AP_Delete(proc->sprite2);
    AP_Delete(proc->sprite1);

    if (CountProcs(ProcScr_GmapRmBorder1) == 1)
        EndGmapRmBaPalAnim1();
}

void GmapRmBorder1_0(struct ProcGmapRmBorder1 * proc)
{
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);
    SetBlendConfig(0, 0, 0x10, 0);

    proc->timer = 0;

    if (CountProcs(ProcScr_GmapRmBorder1) <= 1)
    {
        ApplyPalette(Pal_WmHighLightNationMap, 0x19);
    }
}
