#include "global.h"

/*
 * The register pins and empty barrier are adapted from decomp.me fork XOT5k.
 * Unlike that scratch, this keeps the caller-supplied callback and invokes it
 * indirectly through the compiler-generated _call_via_r3 veneer.
 */

extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern int gUnk_02014F24;
extern u8 gBuf_2014F28[];

struct LinkArenaRecordHeader
{
    u16 seed;
    u16 checksum_a;
    u16 checksum_b;
    u16 block_count;
};

extern struct LinkArenaRecordHeader gUnk_02014FC8;

int sub_80A6A7C(int len);
u16 sub_80A6AA8(void);
u16 sub_80A6C20(u8 * buf, int len);
void sub_80A6C60(void);

void EncodeLinkArenaRecord(void (*func)(int *, u8 *))
{
    int i;
    u8 *cursor;
    u8 *loop_base;
    int len;
    register u8 *buf asm("r6");
    u8 *write_base;
    int zero;
    register u8 *lower asm("r2");
    register void (*callback)(int *, u8 *) asm("r3");

    callback = func;
    len = 0;
    buf = gBuf_2014F28;

    {
        register int *offset asm("r5");

        offset = &gUnk_02014EF4;
        lower = buf;
        zero = 0;
        cursor = buf + 0x9f;

        do
        {
            *cursor = zero;
            cursor--;
        } while ((int)cursor >= (int)lower);

        {
            register u8 *payload asm("r1");

            payload = (u8 *)(*offset);
            payload += (int)buf;
            callback(&len, payload);
        }

        gUnk_02014FC8.block_count = sub_80A6A7C(len);

        {
            register u8 *payload asm("r0");

            loop_base = buf;
            payload = (u8 *)(*offset);
            payload += (int)loop_base;
            gUnk_02014FC8.checksum_a =
                sub_80A6C20(payload, gUnk_02014FC8.block_count);
        }
    }

    {
        int sum;
        register int mask asm("r5");

        sum = (GetGameClock() >> 3) + gUnk_02014FC8.checksum_a;
        mask = 0x3ff;
        gUnk_02014FC8.seed = sum & mask;
        gUnk_02014F24 = gUnk_02014FC8.seed;
        gUnk_02014FC8.checksum_a =
            (sub_80A6AA8() + gUnk_02014FC8.checksum_a) & mask;
    }

    i = 0;

    {
        register u16 count asm("r4");

        count = gUnk_02014FC8.block_count;

        if (i < count)
        {
            loop_base = buf;
            asm("" : "+r"(loop_base));

            do
            {
                write_base = loop_base;
                *((u8 *)(i + gUnk_02014EF4) + (int)write_base) =
                    (sub_80A6AA8() +
                     *((u8 *)(i + gUnk_02014EF4) + (int)loop_base)) &
                    gUnk_02014EF0;
                i++;
            } while (i < gUnk_02014FC8.block_count);
        }
    }

    gUnk_02014FC8.checksum_b =
        (sub_80A6C20((u8 *)(gUnk_02014EF4 + (int)gBuf_2014F28),
                     gUnk_02014FC8.block_count) +
         sub_80A6AA8()) &
        0x3ff;

    sub_80A6C60();
}
