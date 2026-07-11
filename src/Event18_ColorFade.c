#include "global.h"
#include "event.h"
#include "eventscript.h"
#include "bmfx.h"

/*
 * The target passes these halfword-derived values without inserting u16
 * normalizations. The wider declaration preserves the ABI and calls the real
 * NewEventFadefx symbol.
 */
extern void NewEventFadefxWide(
    u32 speed,
    u32 mask,
    u32 r,
    u32 g,
    u32 b,
    struct EventEngineProc * proc) asm("NewEventFadefx");

static inline s8 Event18_SignedByte(int value)
{
    return (s8) value;
}

u8 Event18_ColorFade(struct EventEngineProc * proc)
{
    register struct EventEngineProc * procReg asm("ip") = proc;
    register const u16 * current asm("r0") = procReg->pEventCurrent;
    u8 subcode = current[0] & 0xF;
    u16 packedSize = current[1];
    int start = *((const s8 *) (((const u8 *) current) + 2));
    int size = (s8) (packedSize >> 8);
    register u32 speed asm("r9") = current[2];
    u16 r = current[3];
    u16 g = current[4];
    register u32 b asm("r10") = current[5];
    register u32 one asm("r8");

    switch (subcode)
    {
        case EVSUBCMD_STARTFADE:
            EventStartFade();
            return EVC_ADVANCE_YIELD;

        case EVSUBCMD_ENDFADE:
            EventEndFade();
            return EVC_ADVANCE_YIELD;

        case EVSUBCMD_FADECOLORS:
        {
            u16 state = procReg->evStateBits;
            u32 mask;

            {
                register u32 stateMask asm("r0");

                if ((((state >> 2) & 1) != 0) || ({
                    stateMask = EV_STATE_FADEDIN;
                    asm volatile("and %0, %1"
                        : "+r" (stateMask)
                        : "r" (state));
                    stateMask;
                }))
                {
                    register u32 zero asm("r1") = 0;

                    asm volatile("" : "+r" (zero));
                    speed = zero;
                }
            }

            mask = 0;

            if (size > 0)
            {
                register u32 oneInit asm("r0") = 1;

                asm volatile("" : "+r" (oneInit));
                one = oneInit;

                do
                {
                    mask |= one << start;
                    size = (s8) (size - 1);
                    start = Event18_SignedByte(1 + start);
                }
                while (size > 0);
            }

            NewEventFadefxWide(
                speed,
                mask,
                r,
                g,
                ({
                    register u32 value asm("r1") = b;

                    asm volatile("" : "+r" (value));
                    value;
                }),
                ({
                    register struct EventEngineProc * value asm("r0") = procReg;

                    asm volatile("" : "+r" (value));
                    value;
                }));

            return EVC_ADVANCE_YIELD;
        }

        default:
            return EVC_ERROR;
    }
}
