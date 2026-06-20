#include "global.h"
#include "eventinfo.h"
#include "event.h"
#include "worldmap.h"
int IsWmPlaceDotActiveAtIndex(int);
u8 EventBE_(struct EventEngineProc * proc) {
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    if (EVENT_IS_SKIPPING(proc)) {
        if (IsWmPlaceDotActiveAtIndex(a)) {
            EndWmPlaceDotByIndex(a);
        }
        return EVC_ADVANCE_CONTINUE;
    }
    if (!IsWmPlaceDotActiveAtIndex(a)) {
        return EVC_ADVANCE_YIELD;
    }
    return EVC_STOP_YIELD;
}
