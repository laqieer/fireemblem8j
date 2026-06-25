#include "global.h"
#include "functions.h"
#include "variables.h"

#include "bmsave.h"

/* JP-only link-arena / bonus-claim record loader (0x02014xxx band).
 * Loads the saved GameRankSaveData for (chapter_mode, difficulty) and unpacks
 * its bitfields directly into gArenaUnitRecord (the same struct sub_80A7150
 * deserializes via the bit-stream reader). Returns 1 on a valid record.
 */

struct ArenaUnitRecord
{
    /* 00 */ u8 unk00;
    /* 01 */ u8 unk01;
    /* 02 */ u8 unk02;
    /* 03 */ u8 unk03;
    /* 04 */ u8 unk04;
    /* 05 */ u8 unk05;
    /* 06 */ u8 unk06;
    /* 07 */ u8 unk07;
    /* 08 */ u8 unk08;
    /* 09 */ u8 unk09;
    /* 0A */ u8 unk0A;
    /* 0B */ u8 unk0B;
    /* 0C */ u16 unk0C;
    /* 0E */ u8 unk0E;
    /* 0F */ u8 unk0F;
    /* 10 */ u32 unk10;
};

extern struct ArenaUnitRecord gArenaUnitRecord; /* 0x02014FD0 */

int sub_80A723C(int chapter_mode, int difficulty)
{
    struct GameRankSaveData rank;
    u8 valid;
    int result;

    CpuFill16(0, &gArenaUnitRecord, 0x14);

    valid = GetSavedRankData(&rank, chapter_mode, difficulty);

    if (valid)
    {
        gArenaUnitRecord.unk00 = chapter_mode;
        gArenaUnitRecord.unk02 = difficulty;
        gArenaUnitRecord.unk03 = rank.tacticsRank;
        gArenaUnitRecord.unk04 = rank.survivalRank;
        gArenaUnitRecord.unk05 = rank.fundsRank;
        gArenaUnitRecord.unk06 = rank.expRank;
        gArenaUnitRecord.unk07 = rank.expRank;
        gArenaUnitRecord.unk09 = rank.unk00_17;
        gArenaUnitRecord.unk08 = rank.unk08_15;
        gArenaUnitRecord.unk01 = rank.unk00_16;
        gArenaUnitRecord.unk0C = rank.hours;
        gArenaUnitRecord.unk0E = rank.minutes;
        gArenaUnitRecord.unk0F = rank.seconds;
        gArenaUnitRecord.unk10 = rank.gold;
        gArenaUnitRecord.unk0A = rank.luckydog;
        gArenaUnitRecord.unk0B = rank.cuteguy;
        result = 1;
    }
    else
    {
        result = 0;
    }

    return result;
}
