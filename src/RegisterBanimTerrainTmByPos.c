#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805BD44
void RegisterBanimTerrainTmByPos(s16 distance, s16 position)
{
    int offset;
    int dist = distance;
    int pos = position;

    switch (dist)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_PROMOTION:
            offset = 48;
            if (pos == 0)
            {
                offset = 33;
            }

            break;

        case EKR_DISTANCE_FAR:
            offset = 48;
            if (pos == 0)
            {
                offset = 29;
            }

            break;

        case EKR_DISTANCE_FARFAR:
        case EKR_DISTANCE_MONOCOMBAT:
        default:
            offset = 48;
            if (pos == 0)
            {
                offset = 3;
            }

            break;
    }

    EfxTmCpyExt(gUnkData_1, -1, gTmA_Banim + 0x35A + offset, 0x42, 0xf, 5, -1, -1);

    return;
}
