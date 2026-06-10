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

void EnterSleepMode(int a)
{
    u16 savedIE = REG_IE;

    REG_KEYCNT = a - 0x4000;
    REG_IE &= ~(INTR_FLAG_SERIAL | INTR_FLAG_GAMEPAK);
    REG_IE |= INTR_FLAG_KEYPAD;
    REG_DISPCNT |= DISPCNT_FORCED_BLANK;
    SoundBiasReset();
    asm("swi 3");  // enter sleep mode
    SoundBiasSet();
    REG_IE = savedIE;
}

void ExecBothHBlankHandlers(void)
{
    if (sHBlankHandler1 != NULL)
        sHBlankHandler1();
    if (sHBlankHandler2 != NULL)
        sHBlankHandler2();
}

void UpdateHBlankHandlerState(void)
{
    u8 r2 = (sHBlankHandler1 != NULL);

    switch (r2 + (sHBlankHandler2 != NULL) * 2)
    {
    case 0:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_HBLANK;
        break;
    case 1:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, sHBlankHandler1);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 2:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, sHBlankHandler2);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    case 3:
        gLCDControlBuffer.dispstat.hblankIrqEnable = 1;
        SetIRQHandler(1, ExecBothHBlankHandlers);
        REG_IE |= INTR_FLAG_HBLANK;
        break;
    }
}
