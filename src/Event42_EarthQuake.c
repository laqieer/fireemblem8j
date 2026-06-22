#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "bmio.h"
#include "bm.h"
#include "scene.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "bmfx.h"

//! FE8U = 0x08010D9C
u8 Event42_EarthQuake(struct EventEngineProc * proc)
{
    u8 c;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u8 direction = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    int play_sound = (s8)(EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8);

    switch (subcmd)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc))
            {
                return EVC_ADVANCE_CONTINUE;
            }

            switch (proc->activeTextType)
            {
                case 0:
                case 3:
                case 4:
                    subcmd = 0;
                    break;

                case 1:
                    subcmd = 1;
                    break;

                case 2:
                case 5:
                    return EVC_ERROR;
            }

            StartEventEarthQuake(subcmd, direction, play_sound);

            break;

        case 0xf:
            EndEventEarthQuake();
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}
