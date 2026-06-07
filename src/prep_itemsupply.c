#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"



//! FE8U = 0x0809EA7C
void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc)
{
    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            pGMapBaseMenuProc->unk_2b = proc->currentPage;
        }
    } else {
        if (proc->unk_30 == 0) {
            struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
            pAtMenuProc->unk_32 = proc->currentPage;
        }
    }

    EndAllProcChildren(proc);
    EndMuralBackground_();

    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x0809EAD8
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent)
{
    struct PrepItemSupplyProc* proc = Proc_StartBlocking(ProcScr_PrepItemSupplyScreen, parent);
    proc->unit = unit;
    proc->unk_30 = 0;
    return;
}

//! FE8U = 0x0809EAF4
void PrepItemSupply_ShowActiveUnitOnEnter(void)
{
    if (gActiveUnit) {
        EndAllMus();
        ShowUnitSprite(gActiveUnit);
    }

    return;
}

//! FE8U = 0x0809EB14
void PrepItemSupply_StartActiveUnitMuOnExit(void)
{
    if (gActiveUnit) {
        HideUnitSprite(gActiveUnit);
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();
    }

    return;
}

//! FE8U = 0x0809EB38
void StartBmSupply(struct Unit* unit, ProcPtr unused) {
    struct PrepItemSupplyProc* proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 1;
    return;
}

//! FE8U = 0x0809EB58
void MaybeStartSelectConvoyItemProc(struct Unit * unit, ProcPtr unused)
{
    struct PrepItemSupplyProc* proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 2;
    return;
}
