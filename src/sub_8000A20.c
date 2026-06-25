#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "ap.h"
#include "mu.h"
#include "rng.h"
#include "bmsave.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bm.h"

void StoreIRQToIRAM(void);
void sub_80A7680(void);
void sub_80C165C(void);
void sub_8009E68(void);
void sub_80012E4(void);
void sub_8001BD0(void);

void AgbMain(void)
{
    // clear RAM
    DmaFill32(3, 0, (void *)IWRAM_START, 0x7F80); // reset the area for the IWRAM ARM section.
    CpuFastFill(0, (void *)EWRAM_START, 0x40000);

    REG_WAITCNT = WAITCNT_SRAM_4 |          /* SRAM Wait Control          = 4 cycles */
                  WAITCNT_WS0_N_3 |         /* Wait State 0 First Access  = 3 cycles */
                  WAITCNT_WS0_S_1 |         /* Wait State 0 Second Access = 1 cycle  */
                  WAITCNT_WS1_N_3 |         /* Wait State 1 First Access  = 3 cycles */
                  WAITCNT_WS1_S_1 |         /* Wait State 1 Second Access = 1 cycle  */
                  WAITCNT_WS2_N_3 |         /* Wait State 2 First Access  = 3 cycles */
                  WAITCNT_WS2_S_1 |         /* Wait State 2 Second Access = 1 cycle  */
                  WAITCNT_PHI_OUT_NONE |    /* PHI Terminal Output disabled */
                  WAITCNT_PREFETCH_ENABLE | /* Game Pak Prefetch Buffer enabled */
                  WAITCNT_AGB;

    StoreIRQToIRAM();
    SetInterrupt_LCDVBlank(NULL);

    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
    ResetKeyStatus(gKeyStatusPtr);
    UpdateKeyStatus(gKeyStatusPtr);
    StoreRoutinesToIRAM();
    sub_80A7680();
    Proc_Init();
    AP_ClearAll();
    InitMus();
    SetLCGRNValue(0x42D690E9);
    InitRN(AdvanceGetLCGRNValue());
    EraseInvalidSaveData();
    EraseSramDataIfInvalid();

    // initialize sound
    m4aSoundInit();
    Sound_SetDefaultMaxNumChannels();

    SetInterrupt_LCDVBlank(OnVBlank);
    sub_80C165C();
    sub_8009E68();

    // perform the game loop.
    while (1)
    {
        sub_80012E4();
        sub_8001BD0();
    };
}
