#include "global.h"
#include "functions.h"
#include "variables.h"

extern int sub_80A6AFC(int stream, int ctx, int value, int nbits);

/* JP-only link-arena / multiplayer record SERIALIZER (0x02014xxx band).
 * Mirror of the deserializer sub_80A7150: snapshots the read cursor, then packs
 * the arena record struct into a packed unit/team record via 17 sequential
 * bit-writes (sub_80A6AFC = write-N-bits). The width=5 field is a fresh RNG
 * sample (GetGameClock), not a struct read.
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

void sub_80A705C(int ctx, int stream)
{
    gArenaReadCursorCopy = gArenaReadCursor;

    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk00, 2);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk01, 1);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk02, 1);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk0A, 8);
    sub_80A6AFC(stream, ctx, GetGameClock(), 5);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk03, 3);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk04, 3);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk05, 3);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk06, 3);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk07, 3);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk09, 8);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk08, 6);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk0C, 0xA);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk0E, 6);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk0F, 6);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk0B, 8);
    sub_80A6AFC(stream, ctx, gArenaUnitRecord.unk10, 0x18);
}
