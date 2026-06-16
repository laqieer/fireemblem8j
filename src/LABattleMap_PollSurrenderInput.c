#include "global.h"
#include "hardware.h"
#include "sio_core.h"
#include "sio.h"

void LABattleMap_PollSurrenderInput(void)
{
    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        gSioMsgBuf.kind = 0xC4; // JP: 0xC4 (US SIO_MSG_84=0x84) -- region-different msg id
        gSioMsgBuf.sender = gSioSt->selfId;
        gSioMsgBuf.param = 0;
        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
    }

    return;
}
