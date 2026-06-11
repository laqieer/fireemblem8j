#include "global.h"
#include "hardware.h"
#include "anime.h"

void Anim_0(struct Anim* anim, u32 instruction)
{
    switch (ANINS_COMMAND_GET_ID(instruction))
    {

    case ANIM_CMD_WAIT_01:
    case ANIM_CMD_WAIT_02:
    case ANIM_CMD_WAIT_03:
    case ANIM_CMD_WAIT_04:
    case ANIM_CMD_WAIT_05:
    case ANIM_CMD_WAIT_13:
    case ANIM_CMD_WAIT_18:
    case ANIM_CMD_WAIT_2D:
    case ANIM_CMD_WAIT_39:
    case ANIM_CMD_WAIT_52:
        anim->pScrCurrent--;
        break;

    } // switch (ANINS_COMMAND_GET_ID(instruction))
}
