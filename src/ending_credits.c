#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"

#include "ending_credits.h"

struct CreditsCG
{
    /* 00 */ u8 * img[10];
    /* 28 */ u8 * tsa;
    /* 2C */ u16 * pal;
    /* 30 */ u16 unk_30;
    STRUCT_PAD(0x32, 0x34);
};

struct CreditsSubProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct CreditsCG * cg;
    /* 30 */ s16 unk_30;
    /* 32 */ STRUCT_PAD(0x32, 0x34);
    /* 34 */ s16 unk_34;
};

struct CreditsMainProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 29 */ u8 unk_29_2 : 1;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ s8 unk_34;
    /* 35 */ s8 unk_35;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ const struct CreditsCG * cg;
    /* 48 */ s8 unk_48;
    /* 4A */ s16 timer;
};

struct StaffReelEnt
{
    /* 00 */ void * img;
    /* 04 */ void * tsa;
};

struct CreditsEnt
{
    /* 00 */ const struct StaffReelEnt * entry;
    /* 04 */ const struct CreditsCG * cg[2];
    /* 0C */ int unk_0c; // delay before playing the CG
    /* 10 */ int unk_10; // delay before playing next staff credit roll
};

extern const struct CreditsEnt gEndingCredits_0[];
extern const u32 gEndingCredits_1[];

extern u16 gUnk_33[];

#define CREDITS_PARENT(proc) ((struct CreditsMainProc *)(proc->proc_parent))

// TODO: Implicit declaration
int CheckGameEndFlag(void);

/* prototypes for same-file helpers called by this run */
void StartBlendCreditsCGMaybe(ProcPtr parent, const struct CreditsCG * cg);
bool IsCreditsBlendCGActive(void);

//! FE8U = 0x080C43B4
void EndingCredits_UpdateScroll(struct CreditsMainProc * proc)
{
    int unk_30 = (proc->unk_30 >> 8);
    proc->unk_38 = unk_30 / 16;

    if (proc->unk_38 != proc->unk_36)
    {
        int tmp = unk_30 + 240;
        int val = tmp - (tmp / 0x100) * 0x100;
        val = ((val / 8) * 32);

        CpuFastCopy(gUnk_33 + val, gBG0TilemapBuffer + val, 0x80);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        proc->unk_36 = proc->unk_38;
    }

    if (!IsCreditsBlendCGActive() && (proc->unk_2c != proc->unk_30) && ((proc->unk_29_2) != 0) && (proc->unk_30 >= proc->unk_3c))
    {
        StartBlendCreditsCGMaybe(proc, proc->cg);
    }

    BG_SetPosition(BG_0, 0, unk_30 & 0xff);

    proc->unk_2c = proc->unk_30;

    return;
}

//! FE8U = 0x080C4460
void EndingCredits_Init(struct CreditsMainProc * proc)
{
    u32 chr;
    int i;

    SetPrimaryHBlankHandler(NULL);
    SetupBackgrounds(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendAlpha(16, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    CpuFastFill(0, gPaletteBuffer, PLTT_SIZE);

    ApplyPalette(Pal_StaffReelEnt_EndingFin, 7);

    CpuFastFill(-1, (void *)(VRAM + (chr = gEndingCredits_1[0])), 0x20);

    chr = chr >> 5;

    for (i = 0; i < 0x400; i++)
    {
        gBG0TilemapBuffer[i] = (chr) + 0x7000;
    }

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    EnablePaletteSync();

    SetDispEnable(1, 0, 0, 1, 0);

    SetDefaultColorEffects();

    BG_SetPosition(BG_3, 0, 0);

    proc->unk_29_0 = 0;
    proc->unk_29_1 = 0;
    proc->unk_2c = 0;
    proc->unk_30 = 0;
    proc->unk_34 = 0xff;
    proc->unk_35 = 0;
    proc->unk_36 = 0;
    proc->unk_38 = 0;
    proc->timer = 0;

    return;
}

//! FE8U = 0x080C45E0
void EndingCredits_LoadCG(struct CreditsMainProc * proc)
{
    if (proc->unk_29_1)
    {
        if (proc->unk_48 < 10)
        {
            Decompress(proc->cg->img[proc->unk_48], (void *)(0x06008000 + proc->unk_48 * 0x800));
        }
        else
        {
            CallARM_FillTileRect(gBG3TilemapBuffer, proc->cg->tsa, 0);
            BG_EnableSyncByMask(BG3_SYNC_BIT);

            ApplyPalettes(proc->cg->pal, 0, 6);
            EnablePaletteSync();
        }

        proc->unk_48++;

        if (proc->unk_48 > 10)
        {
            proc->unk_29_1 = 0;
        }
    }

    return;
}
