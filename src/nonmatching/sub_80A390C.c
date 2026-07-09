/* NON_MATCHING: byte source is asm/sub_80A390C.s @ JP 0x080A390C (region-different,
 * JP-only augury/divination subsystem; gbadisasm descriptive asm, D23). carved_rom
 * places those bytes; this C DOCUMENTS the reconstruction and is NOT in make-compare:
 * it is compiled only by `make nonmatching` (never linked, never checksummed).
 *
 * Proposed name: Augury_InitResultScreen  (占い result-screen ProcScr OnInit).
 *
 * WHAT IT DOES
 *   1. Zero-fills a 0x18-byte `struct GameRankSaveData` scratch (sub_80D6370 = CpuSet,
 *      control 0x0100000C = fixed-source fill, 0xC halfwords = 0x18 bytes).
 *   2. GetSavedRankData(&rank, proc->index, proc->unlocked) loads the saved ranking
 *      record for this (chapter_mode, difficulty) slot.
 *   3. Bit-unpacks the record into the AuguryProc fields (see field map below).
 *   4. Computes the composite letter grade via GetOverallRank(5 category ranks).
 *   5. Decompresses the panel gfx from Tsa_SupportScreenWindow -> gGenericBuffer and applies the
 *      TSA to gBG1TilemapBuffer (Decompress = Decompress, j_TmApplyTsa).
 *   6. Draws the two sub-panels (DrawAuguryResultPanel text/values, sub_80A33E0), then, when the
 *      record is valid and carries a portrait, starts the tactician face (sub_80063F8)
 *      and the rank-badge CG (StartCgText / SetCgTextFlags).
 *
 * AuguryProc field map CONFIRMED by this unpack (consumed by carved sibling
 * src/nonmatching/DrawAuguryResultPanel.c and src/sub_80A3C64.c):
 *   0x34..0x38 rowCounts[5] = {tacticsRank, survivalRank, fundsRank, expRank, combatRank}
 *              (invalid record -> each |= 0xFF, i.e. 0xFF "dash")
 *   0x39 overallRank  = GetOverallRank(rowCounts[0..4])
 *   0x3A unk3A        = GameRankSaveData.unk00_17  (8-bit; bits 23..30)
 *   0x3B valid        = GameRankSaveData.valid
 *   0x3C index        = chapter_mode selector (INPUT, passed to GetSavedRankData)
 *   0x3D unlocked     = difficulty/unlock (INPUT, passed to GetSavedRankData)
 *   0x3E hasCustomName= GameRankSaveData.unk00_16 (gates tactician-name copy)
 *   0x3F portraitId   = GameRankSaveData.luckydog (record byte 0x17)
 *   0x40..0x42 turnsA/B/C = clear time H:MM:SS = {hours, minutes, seconds}
 *   0x43..0x4D tacticianName[0xB]
 *   0x4E winCount     = GameRankSaveData.unk08_15 (6-bit; word 0x08 bits 85..90)
 *   0x58 score (int)  = GameRankSaveData.gold (24-bit; struct bits 61..84)
 *
 * NOTE ON THE 24-bit GOLD/SCORE UNPACK: agbcc tight-packs GameRankSaveData bitfields
 * ACROSS the 32-bit unit boundary (pre-EABI), so `hours` sits at struct bit 39 and
 * `gold` at struct bit 61 -- the header widths in ../fireemblem8u/include/bmsave.h are
 * exact; do NOT re-derive them from the raw shift amounts.
 *
 * STATUS: NONMATCHING-DOCUMENTED. There is no fe8u twin (JP-only), so this is a
 * ground-up reconstruction from the gbadisasm asm + the carved augury siblings. See
 * the trailing BLOCKING-DIFF banner for the exact residual class.
 */
#include "global.h"
#include "bmsave.h"
#include "hardware.h"
#include "functions.h"

struct AuguryProc
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ u8 rowCounts[5];
    /* 39 */ u8 overallRank;
    /* 3A */ u8 unk3A;
    /* 3B */ u8 valid;
    /* 3C */ u8 index;
    /* 3D */ u8 unlocked;
    /* 3E */ u8 hasCustomName;
    /* 3F */ u8 portraitId;
    /* 40 */ u8 turnsA; /* hours   */
    /* 41 */ u8 turnsB; /* minutes */
    /* 42 */ u8 turnsC; /* seconds */
    /* 43 */ char tacticianName[0xB];
    /* 4E */ u8 winCount;
    /* 4F */ STRUCT_PAD(0x4F, 0x58);
    /* 58 */ int score;
};

/* 0x34-stride augury entry table (see src/sub_80A3C64.c). */
struct AuguryEntry
{
    /* 00 */ u8 pad00[6];
    /* 06 */ u16 msgid;
    /* 08 */ u8 pad08[0x34 - 0x08];
};

extern struct AuguryEntry gUnk_088582BC[];
extern const u8 Tsa_SupportScreenWindow[]; /* carved panel gfx (region-same) */

/* Kept as their existing project sub_ spellings so `make nonmatching` sees no
 * duplicate/renamed symbols; annotated with their role for readers. */
void sub_80D6370(const void *src, void *dst, u32 control);        /* CpuSet          */
void Decompress(const void *src, void *dst);                     /* Decompress      */
void j_TmApplyTsa(void *dst, const void *tsa, int base);
int  sub_80A40A0(int portraitId, int overallRank);                /* validate/select */
char *GetStringFromIndex(int msgId);                                     /* GetStringFromIndex-like */
void sub_8031438(char *str);                                      /* store tactician name    */
void sub_80063F8(int a, int msgid, int x, int y, int e);          /* start face      */
void InitTalk(int a, int b, int c);
void StartCgText(int a, int b, int c, int d, int e, void *vram, int g, int h);
void sub_8091544(void);
void EndFaceById(int faceSlot);
void SetCgTextFlags(int flags);
void DrawAuguryResultPanel(struct AuguryProc *proc);
void sub_80A33E0(struct AuguryProc *proc);

void Augury_InitResultScreen(struct AuguryProc *proc)
{
    struct GameRankSaveData rank;
    u16 zero;
    int i;
    int r5;

    zero = 0;
    /* CpuSet fixed-source fill: zero the 0x18-byte record (0xC halfwords). */
    sub_80D6370(&zero, &rank, 0x0100000C);

    GetSavedRankData(&rank, proc->index, proc->unlocked);

    proc->valid = rank.valid;
    if (proc->valid)
    {
        proc->rowCounts[0] = rank.tacticsRank;
        proc->rowCounts[1] = rank.survivalRank;
        proc->rowCounts[2] = rank.fundsRank;
        proc->rowCounts[3] = rank.expRank;
        proc->rowCounts[4] = rank.combatRank;
        proc->hasCustomName = rank.unk00_16;
        proc->turnsA = rank.hours;
        proc->turnsB = rank.minutes;
        proc->turnsC = rank.seconds;
        proc->score  = rank.gold;
        proc->portraitId = rank.luckydog;
        proc->overallRank = GetOverallRank(rank.tacticsRank, rank.survivalRank,
                                           rank.fundsRank, rank.expRank, rank.combatRank);
        proc->winCount = rank.unk08_15;
        proc->unk3A = rank.unk00_17;

        if (proc->hasCustomName)
        {
            strcpy(proc->tacticianName, rank.tactician_name);
            sub_8031438(proc->tacticianName);
        }
        else
        {
            sub_8031438(GetStringFromIndex(0x1F1));
        }

        if (proc->portraitId != 0 && sub_80A40A0(proc->portraitId, proc->overallRank) == 0)
            proc->portraitId = 0;

        if (proc->portraitId == 0)
        {
            /* JP: index-conditional block whose arms both clear portraitId. */
            if (proc->index != 0)
                proc->portraitId = 0;
            else
                proc->portraitId = 0;
        }
    }
    else
    {
        for (i = 0; i <= 4; i++)
            proc->rowCounts[i] |= 0xFF;
    }

    /* --- draw --- */
    Decompress(Tsa_SupportScreenWindow, gGenericBuffer);
    j_TmApplyTsa(gBG1TilemapBuffer, gGenericBuffer, 0xA5 << 7);
    DrawAuguryResultPanel(proc);
    sub_80A33E0(proc);
    BG_EnableSyncByMask(7);
    EndFaceById(0);
    sub_8091544();

    if (proc->valid && proc->portraitId != 0)
    {
        sub_80063F8(0, gUnk_088582BC[proc->portraitId - 1].msgid, 0xD8, 0x58, 0x182);
        r5 = sub_80A40A0(proc->portraitId, proc->overallRank);
        InitTalk(0x28, 0, 1);
        StartCgText(0x16, 0x13, 0x12, 4, r5, (void *)0x06011000 /* VRAM */, 0xA, 0);
        SetCgTextFlags(0x000809FE);
    }
}

/* ============================ BLOCKING DIFF ==================================
 * CLASS: agbcc register-coloring + field-pointer materialization (reg-pressure).
 *        NOT a logic diff -- every bitfield extraction matches the JP asm
 *        bit-for-bit (identical lsls/lsrs shift amounts, identical loads/stores).
 *
 * Verified with: arm-none-eabi-as asm/sub_80A390C.s -> objdump vs this .o objdump
 *   (normalized, address/reloc-masked).  GT = JP asm, MINE = this reconstruction.
 *   GT = 272 insns, MINE = 259 insns (MINE 13 fewer).
 *
 * ROOT DIFFERENCE:
 *   - `proc` lives in r6 in the JP build; agbcc puts it in r7 here.
 *   - The JP build HOISTS several `proc+0x3X` byte-pointers into the high regs
 *     r8 / ip / sb up front (e.g. `movs r1,#0x35; adds r1,r1,r6; mov r8,r1`),
 *     because rowCounts[1..4] pointers are kept live and REUSED at the
 *     GetOverallRank(...) argument gather.  This codegen re-forms those field
 *     pointers incrementally at the call site instead (`adds rN,#off`/`subs
 *     r1,#7`), yielding fewer, differently-allocated instructions.
 *   - Everything downstream (score 24-bit assemble, name branch, portrait/CG
 *     block) is structurally identical modulo the r6<->r7 base-register swap.
 *
 * WHY NOT CHASED: this is the documented agbcc reg-pressure plateau for this
 * cluster; the gap is a whole-function allocation shape (13 insns), not a
 * <10-byte tail -- outside the single-short-pass permuter budget.  Left as
 * NONMATCHING-DOCUMENTED; the JP bytes remain in asm/sub_80A390C.s.
 * ========================================================================== */
