/*
 * Register lifetimes reproduce the JP allocator while preserving the real
 * caller callback. The callback is invoked normally, so agbcc selects the
 * project's existing _call_via_r9 veneer. The empty asm is a zero-instruction
 * lifetime fence for the shared 10-bit mask; it emits no raw opcode.
 */
#include "global.h"

extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern int gUnk_02014F24;
extern u8 gBuf_2014F28[];

struct LinkArenaRecordHeader
{
    u16 seed;
    u16 tag0;
    u16 tag1;
    u16 count;
};

extern struct LinkArenaRecordHeader gUnk_02014FC8;

void DecodeLinkArenaRecordHeader(void);
int sub_80A6C20(u8 * buf, int len);
int sub_80A6AA8(void);

int DecodeAndVerifyArenaRecord(void (*consume)(int *, u8 *))
{
    u16 tags[2];
    int cbarg;
    register int chk asm("r6");
    int i;
    u8 *base;

    {
        register void (*callback)(int *, u8 *) asm("r9");
        register int *cbptr asm("r8");

        callback = consume;
        cbarg = 0;
        DecodeLinkArenaRecordHeader();
        gUnk_02014F24 = gUnk_02014FC8.seed;

        {
            int first_offset = gUnk_02014EF4;

            base = gBuf_2014F28;
            chk = (u16)sub_80A6C20(base + first_offset, gUnk_02014FC8.count);
        }

        tags[0] = sub_80A6AA8();
        i = 0;
        cbptr = &cbarg;

        if (i < gUnk_02014FC8.count)
        {
            register u8 *loop_base asm("r4");

            loop_base = base;

            do
            {
                int random = sub_80A6AA8();
                u8 *cursor = (u8 *)(i + gUnk_02014EF4 + (int)loop_base);

                *cursor = (*cursor - random) & gUnk_02014EF0;
                i++;
            }
            while (i < gUnk_02014FC8.count);
        }

        tags[1] = sub_80A6AA8();
        callback(cbptr, gBuf_2014F28 + gUnk_02014EF4);
    }

    {
        register int raw_mask asm("r1");
        register int mask asm("r2");
        int expected0;

        expected0 = sub_80A6C20(gBuf_2014F28 + gUnk_02014EF4,
                                 gUnk_02014FC8.count) + tags[0];
        raw_mask = 0x3FF;
        asm("" : "+r"(raw_mask));
        mask = raw_mask;
        expected0 &= mask;
        chk = (chk + tags[1]) & mask;

        if (gUnk_02014FC8.tag0 != expected0)
            return 0;

        if (gUnk_02014FC8.tag1 == chk)
            return 1;
    }

    return 0;
}
