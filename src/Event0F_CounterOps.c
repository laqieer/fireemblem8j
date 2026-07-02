#include "global.h"

//! FE8U = eventscr.c Event0F_CounterOps (u8 return, macro-based, NON_MATCHING here)
// JP 0x0800DE3C region-different: the fe8u-shaped C is a reg-coloring NEAR. The
// score-0 decomp.me fork cTKJG pins the counter mask/value temporaries to their
// JP registers (ip/r0/r2/r3) with inline asm and a `volatile short` return,
// reproducing the JP codegen byte-for-byte. We keep the fork body verbatim and
// only swap its hardcoded gEventSlots/gEventSlotCounter addresses for the real
// linker symbols (same addresses: 0x030004B0 / 0x03000560). The local struct +
// `volatile short` return are kept deliberately: pulling event.h would drag in
// its `u8 Event0F_CounterOps(...)` prototype, conflicting with the matched type.
// (decomp.me fork cTKJG, score 0)

struct EventEngineProc
{
    unsigned char _pad00[0x38];
    const u16 *pEventCurrent;
    u16 evStateBits;
    unsigned char _pad3E[0x54 - 0x3E];
};

extern u32 gEventSlots[0xE];
extern u32 gEventSlotCounter;

volatile short Event0F_CounterOps(struct EventEngineProc *proc)
{
    register int maskIp asm("ip");
    register int maskSrc asm("r2");
    int mask;
    const u16 *event = proc->pEventCurrent;
    register u8 first asm("r1");

    first = *((const u8 *) event);

    maskSrc = 0xF;
    asm("mov %0, %1" : "=r"(maskIp) : "r"(maskSrc));
    mask = 0xF;
    asm("add %0, %1, #0" : "=r"(maskSrc) : "r"(mask));
    {
        register int newValue asm("r3");
        u8 subcode = first & maskSrc;
        u32 argument = event[1];
        u32 shift = 4 * ((*((const u8 *) (event + 1))) % 8);
        switch (subcode)
        {
            case 0:
                gEventSlots[0xC] = (gEventSlotCounter >> shift) & mask;
                return 0;

            case 1:
            {
                register int temp asm("r0");
                temp = argument << 16;
                asm("asr %0, %1, #24" : "=r"(newValue) : "r"(temp));
                break;
            }

            case 2:
                newValue = ((gEventSlotCounter >> shift) & maskIp) + 1;
                if (newValue > mask)
            {
                newValue = 0xF;
            }
                break;

            case 3:
                newValue = gEventSlotCounter >> shift;
                asm("mov r2, %1\n\tand %0, r2" : "+r"(newValue) : "r"(maskIp));
                newValue = newValue - 1;
                if (0 > newValue)
            {
                newValue = 0;
            }
                break;

        }

        {
            register u32 maskFinal asm("r0");
            register u32 oldValue asm("r2");
            u32 clearMask;

            maskFinal = 0xF;
            clearMask = maskFinal << shift;
            oldValue = gEventSlotCounter;
            oldValue &= ~clearMask;
            asm("and %0, %1\n\tlsl %0, %2" : "+r"(newValue) : "r"(maskFinal), "r"(shift));
            oldValue |= newValue;
            gEventSlotCounter = oldValue;
        }
    }
    return 0;
}
