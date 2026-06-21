#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "bmunit.h"
#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

//! FE8U = 0x0800DD68
u8 Event0D_AsmCall(struct EventEngineProc * proc)
{
    u32 _cmd_mask;
    u8 _cmd;
    void (*func)(struct EventEngineProc *);

    _cmd = *proc->pEventCurrent;
    _cmd_mask = 0xF;
    _cmd_mask &= _cmd;

    func = (void *)EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if (_cmd_mask == 0x1 && EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    func(proc);
    return EVC_ADVANCE_YIELD;
}
