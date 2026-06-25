#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"
#include "sysutil.h"
#include "functions.h"

struct Proc80A3074
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk2C;
    /* 30 */ STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rankTactics;
    /* 35 */ u8 rankSurvival;
    /* 36 */ u8 rankFunds;
    /* 37 */ u8 rankExp;
    /* 38 */ u8 rankCombat;
    /* 39 */ u8 rankOverall;
};

extern void sub_80A2E64(struct Proc80A3074* proc);
extern u8 gGfx_A9A39C[];
extern u16 gPal_A9A4E4[];

void sub_80A3074(struct Proc80A3074* proc)
{
    proc->rankTactics = GetGameTacticsRank();
    proc->rankSurvival = GetGameSurvivalRank();
    proc->rankFunds = GetGameFundsRank();
    proc->rankExp = GetGameExpRank();
    proc->rankCombat = GetGameCombatRank();

    proc->rankOverall = GetOverallRank(
        proc->rankTactics, proc->rankSurvival, proc->rankFunds, proc->rankExp, proc->rankCombat);

    proc->unk2C = 0;

    Decompress(gGfx_A9A39C, (void*)0x06017000);
    CopyToPaletteBuffer(gPal_A9A4E4, 0xf8 << 2, 0x20);

    StartParallelWorker(sub_80A2E64, proc);
}
