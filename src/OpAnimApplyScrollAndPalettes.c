#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C8564
void OpAnimApplyScrollAndPalettes(struct ProcOpAnim * proc)
{
    OpAnimApplyScrollPalettes(proc->unk46);
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    return;
}
