#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe


















// COMMON
extern u32 gUnk_71;
extern u32 gUnk_72;
extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern u8 gUnk_75[SIO_MAX_PACKET];

// clang-format off





// clang-format on

// TODO: what to do here? This is improvable
struct SioRegs
{
    u16 siocnt;
    u16 siodata;
};

#define SIO ((struct SioRegs *)(&REG_SIOCNT))

/* prototypes for same-file helpers called by this run */
bool Sio_IsPlayerActiveThisFrame(u8 playerId);

int Sio_CountActivePlayers(void)
{
    int i;

    u8 count = 0;

    for (i = 0; i < 4; i++)
    {
        if (Sio_IsPlayerActiveThisFrame(i) == TRUE)
            count++;
    }

    return count;
}
