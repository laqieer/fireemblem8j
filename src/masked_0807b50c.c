#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"




































































void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * movescr)
{
    while (TRUE)
    {
        switch (*movescr++) {
        case MOVE_CMD_END:
        case MOVE_CMD_HALT:
            return;

        case MOVE_CMD_MOVE_LEFT:
            (*x)--;
            break;

        case MOVE_CMD_MOVE_RIGHT:
            (*x)++;
            break;

        case MOVE_CMD_MOVE_UP:
            (*y)--;
            break;

        case MOVE_CMD_MOVE_DOWN:
            (*y)++;
            break;

        case MOVE_CMD_SLEEP:
            movescr++;
            break;

        default:
            break;

        }
    }
}
