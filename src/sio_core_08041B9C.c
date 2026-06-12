#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe

extern struct SioSt EWRAM_DATA gSioStInstance;

extern struct SioSt * SHOULD_BE_CONST gSioSt;

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];











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
bool Sio_CheckLinkAlive(void);
s16 SioSend(const void * src, u16 len);
int SioSend16(u16 * word, int arg_1);
struct SioData * Sio_PeekPendingSendData(u32 * out);

void SioVsync_Loop(void)
{
    int i;
    u32 len;
    struct SioData * dat;

    // TODO: cleanup

    if (gSioSt->unk_004 > 4 && gSioSt->unk_001 != 0)
    {
        gSioSt->unk_01E++;

        if (gSioSt->unk_004 == 6)
        {
            switch (gSioSt->unk_021)
            {
                case 3:
                    if (gSioSt->unk_01E > 60)
                    {
                        gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_0;
                        StartSioErrorScreen();
                    }

                    // fallthrough

                case 2:
                    if (gSioSt->unk_001 != 0 && !Sio_CheckLinkAlive())
                    {
                        gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_0;
                        StartSioErrorScreen();
                    }

                    // fallthrough

                case 1:
                    for (i = 0; i < 4; i++)
                    {
                        if (gSioSt->timeoutClock[i] > 60)
                        {
                            gSioSt->playerStatus[i] = PLAYER_STATUS_0;
                            StartSioErrorScreen();
                        }
                    }

                    break;
            }
        }

        if (gSioSt->unk_001 == 1)
        {
            if (gSioSt->unk_010 == 0)
            {
                if (gSioSt->unk_011 > 60)
                {
                    StartSioErrorScreen();
                    gSioSt->unk_004 = 2;
                    return;
                }

                dat = Sio_PeekPendingSendData(&len);

                if (dat != NULL)
                {
                    if (SioSend(dat, len + offsetof(struct SioData, bytes)) > 0)
                    {
                        gSioSt->unk_010 = 0;
                        gSioSt->unk_011++;
                        gSioSt->unk_02E = 1;
                    }
                }
            }

            gSioSt->unk_010++;
            gSioSt->unk_010 = gSioSt->unk_010 % 38;
        }
        else if (gSioSt->unk_001 == 2 || gSioSt->unk_001 == 3)
        {
            if (gSioSt->selfId == 0)
            {
                SioSend16(&gSioSt->unk_030, -1);
                gSioSt->unk_030 = 0x5FFF;
            }
        }
    }
}
