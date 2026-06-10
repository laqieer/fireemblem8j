#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"











extern void (* EWRAM_DATA gMainCallback)(void);








struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

/* file-scope type definitions used by this run */


struct UnknownDmaStruct
{
    u16 unk00;  // u32? Why do these overlap?
    u8 unk02[1];
};

struct UnknownDmaStruct2
{
    int attr01;
    u16 attr2;
    s16 x;
    s16 y;
};

/* prototypes for same-file helpers called by this run */
void _UpdateKeyStatus(struct KeyStatusBuffer *keyStatus, s16 keys);

void UpdateKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    u16 keys = ~REG_KEYINPUT;

    keys &= KEYS_MASK;
    if ((keys & (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) != (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON))
        keys &= ~gKeyStatusIgnoredSt;
    _UpdateKeyStatus(keyStatus, keys);
}
