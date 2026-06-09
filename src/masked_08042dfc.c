#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

void SetBmStLinkArenaFlag(void)
{
    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;
}

void UnsetBmStLinkArenaFlag(void)
{
    gBmSt.gameStateBits &= ~BM_FLAG_LINKARENA;
}

bool CheckInLinkArena(void)
{
    return !!(gBmSt.gameStateBits & BM_FLAG_LINKARENA);
}
