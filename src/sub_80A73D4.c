#include "global.h"
#include "hardware.h"

void PutNumber(u16 *dst, int color, int number);
void PutNumberOrBlank(u16 *dst, int color, int number);

/* JP-only link-arena ("通信闘技場") scoreboard renderer @ 0x080A73D4.
 * Prints the decoded arena unit record (win/loss counters; sibling of the
 * serializer sub_80A705C / deserializer sub_80A7150) as numbers into the BG2
 * tilemap, laid out across three tile-rows: a1, a1+2, a1+4. */

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

extern struct ArenaUnitRecord gArenaUnitRecord;       /* 0x02014FD0 */

void sub_80A73D4(int a1)
{
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer,  2, a1),     2, gArenaUnitRecord.unk00);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer,  5, a1),     2, gArenaUnitRecord.unk02);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 12, a1),     2, gArenaUnitRecord.unk0B);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, a1),     2, gArenaUnitRecord.unk0A);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer,  2, a1 + 2), 2, gArenaUnitRecord.unk03);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer,  5, a1 + 2), 2, gArenaUnitRecord.unk04);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer,  8, a1 + 2), 2, gArenaUnitRecord.unk05);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 11, a1 + 2), 2, gArenaUnitRecord.unk06);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 14, a1 + 2), 2, gArenaUnitRecord.unk07);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, a1 + 2), 2, gArenaUnitRecord.unk09);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG2TilemapBuffer, 20, a1 + 2), 2, gArenaUnitRecord.unk08);
    PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer,  8, a1 + 4), 2, gArenaUnitRecord.unk10);
    PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 12, a1 + 4), 2, gArenaUnitRecord.unk0C);
    PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 15, a1 + 4), 2, gArenaUnitRecord.unk0E);
    PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 18, a1 + 4), 2, gArenaUnitRecord.unk0F);
}
