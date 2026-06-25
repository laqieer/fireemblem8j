#include "global.h"
#include "functions.h"
#include "variables.h"

extern int sub_80A6B90(int stream, int ctx, int nbits);

/* JP-only link-arena / multiplayer record DESERIALIZER (0x02014xxx band).
 * Snapshots the read cursor, then unpacks a packed unit/team record into the
 * arena record struct via 17 sequential bit-reads (sub_80A6B90 = read-N-bits).
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

extern struct ArenaUnitRecord gArenaUnitRecord;       /* 0x02014FD0 */
extern int gArenaReadCursor;                          /* 0x02014EF8 */
extern int gArenaReadCursorCopy;                      /* 0x02014F24 */

void sub_80A7150(int ctx, int stream)
{
    gArenaReadCursorCopy = gArenaReadCursor;

    gArenaUnitRecord.unk00 = sub_80A6B90(stream, ctx, 2);
    gArenaUnitRecord.unk01 = sub_80A6B90(stream, ctx, 1);
    gArenaUnitRecord.unk02 = sub_80A6B90(stream, ctx, 1);
    gArenaUnitRecord.unk0A = sub_80A6B90(stream, ctx, 8);
    sub_80A6B90(stream, ctx, 5);
    gArenaUnitRecord.unk03 = sub_80A6B90(stream, ctx, 3);
    gArenaUnitRecord.unk04 = sub_80A6B90(stream, ctx, 3);
    gArenaUnitRecord.unk05 = sub_80A6B90(stream, ctx, 3);
    gArenaUnitRecord.unk06 = sub_80A6B90(stream, ctx, 3);
    gArenaUnitRecord.unk07 = sub_80A6B90(stream, ctx, 3);
    gArenaUnitRecord.unk09 = sub_80A6B90(stream, ctx, 8);
    gArenaUnitRecord.unk08 = sub_80A6B90(stream, ctx, 6);
    gArenaUnitRecord.unk0C = sub_80A6B90(stream, ctx, 0xA);
    gArenaUnitRecord.unk0E = sub_80A6B90(stream, ctx, 6);
    gArenaUnitRecord.unk0F = sub_80A6B90(stream, ctx, 6);
    gArenaUnitRecord.unk0B = sub_80A6B90(stream, ctx, 8);
    gArenaUnitRecord.unk10 = sub_80A6B90(stream, ctx, 0x18);
}
