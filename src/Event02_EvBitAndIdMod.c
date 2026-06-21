#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "bmunit.h"
#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

//! FE8U = 0x0800D914
u8 Event02_EvBitAndIdMod(struct EventEngineProc * proc)
{
    int sub_cmd_lo = EVT_SUB_CMD_LO(proc->pEventCurrent);
    int sub_cmd_hi = EVT_SUB_CMD_HI(proc->pEventCurrent);
    int arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (arg < 0)
        arg = (s16)gEventSlots[2];

    switch (sub_cmd_lo)
    {
        case 0:
            if (sub_cmd_hi == 0)
                proc->evStateBits &= ~(1 << (s16)arg); /* EVSUBCMD_EVBIT_F */
            else
                proc->evStateBits |= (1 << (s16)arg); /* EVSUBCMD_EVBIT_T */
            break;

        case 1:
            if (sub_cmd_hi == 0)
                ClearFlag((s16)arg); /* EVSUBCMD_ENUF */
            else
                SetFlag((s16)arg); /* EVSUBCMD_ENUT */
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}
