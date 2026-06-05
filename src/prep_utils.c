#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

//! FE8U = 0x08097CD8
void ViewCounter_Loop(struct ViewCounterProc * proc)
{

    if (proc->targetFrameCount == proc->counter) {
        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 1;
        gLCDControlBuffer.dispcnt.obj_on = 1;

        Proc_Break(proc);
    }

    proc->counter++;

    return;
}

//! FE8U = 0x08097D14
void StartViewCounter(u16 frames, ProcPtr parent)
{
    struct ViewCounterProc* proc = Proc_Start(ProcScr_ViewCounter, parent);

    proc->counter = 0;
    proc->targetFrameCount = frames;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x08097D54
void TryLockProc(ProcPtr proc)
{
    struct Proc * proc_ = proc;
    if (proc_ != 0)
        proc_->proc_lockCnt++;
}

//! FE8U = 0x08097D68
void TryUnlockProc(ProcPtr proc)
{
    struct Proc* proc_ = proc;
    if (proc_ != 0 && proc_->proc_lockCnt != 0)
        proc_->proc_lockCnt--;
}

//! FE8U = 0x08097D80
void PrepHbKeyListener_Loop(ProcPtr proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY)) {
        CloseHelpBox();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08097DA8
ProcPtr StartPrepErrorHelpbox(int x, int y, int msgId, ProcPtr parent) {
    if (x < 0 && y < 0) {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    StartHelpBox(x, y, msgId);

    return Proc_StartBlocking(gProcScr_PrepHelpboxListener, parent);
}

//! FE8U = 0x08097DE0
s8 IsWeaponUsable(struct Unit * unit, int item)
{
    if (!CanUnitUseWeapon(unit, item)) {
        return 0;
    }

    if (GetItemAttributes(item) & IA_UNCOUNTERABLE) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08097E08
int CountUnitUsableWeapons(struct Unit * unit)
{
    int i;

    int count = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (IsWeaponUsable(unit, unit->items[i]) == 1) {
            count++;
        }
    }

    return count;
}
