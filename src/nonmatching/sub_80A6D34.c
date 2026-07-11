/* NON_MATCHING: byte source remains asm/sub_80A6D34.s @ JP 0x080A6D34.
 * Bounded 2026-07-11 campaign: four independent local -O2 lanes x 15,000
 * candidates. This phase-local/P13 shape scores 495, improving the prior 1320
 * floor. It uses the FE6/JP register roles (zero=sl, i=r7, cursor=r6,
 * header=r8, bit-width pointer=r9, bucket=r5, bits=r4), named project globals,
 * hard-register declarations, and empty lifetime constraints only (no raw opcode).
 *
 * Semantics: PROVEN-BOUNDED(3), plus 60/60 EQUIV concrete trials using the
 * existing link-codec domain clamp (small header length/count and valid mask).
 * Lower raw permuter scores 305/359 were rejected because they hoisted the
 * bucket or changed the loop condition. Remaining code residual: two commutative
 * operand-order differences, seven low-register swaps in the subtract/mask loop,
 * and the checksum_a/checksum_b field tails use pointer adds + a shared tail
 * instead of JP's immediate-offset duplicated tails (19 register penalties,
 * 2 insertions, 2 deletions). Promotion to src/ still requires score 0.
 */
#include "global.h"

extern int gUnk_02014EEC;
extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern u8 gBuf_2014F28[];

struct LinkArenaRecordHeader
{
    u16 seed;
    u16 checksum_a;
    u16 checksum_b;
    u16 block_count;
};

extern struct LinkArenaRecordHeader gUnk_02014FC8;

u16 sub_80A6C20(u8 * buf, int len);
void sub_80A6AC0(void);

void DecodeLinkArenaRecordHeader(void)
{
    register int zero asm("sl");
    int i;
    int j;
    int zero_value;

    zero = 0;
    i = 0;

    sub_80A6AC0();

    {
        register int * count asm("r4");
        register int checksum asm("r5");
        register u8 * call_buf asm("r6");
        int count_value;

        count = &gUnk_02014EF4;
        count_value = *count;
        call_buf = gBuf_2014F28;
        checksum =
            sub_80A6C20(call_buf + count_value,
                         gUnk_02014FC8.block_count);
        asm("" : "+r"(checksum));
        j = 0;

        if (zero < *count)
        {
            register u8 * loop_base asm("r8");
            register int * mask asm("r6");
            register u8 * at asm("r2");

            loop_base = call_buf;
            mask = &gUnk_02014EF0;
            asm("" : "+r"(loop_base), "+r"(mask));

            do
            {
                register u8 * base_read asm("r1");

                base_read = loop_base;
                asm("" : "+r"(base_read));
                at = base_read + j;
                *at = (*at - checksum) & *mask;
                j++;
            } while (j < *count);
        }
    }

    {
        register int bits asm("r4");
        register int bucket asm("r5");
        register u8 * cursor asm("r6");
        register struct LinkArenaRecordHeader * header asm("r8");
        register int * bit_width asm("r9");
        struct LinkArenaRecordHeader * clear_header;

        zero_value = 0;
        clear_header = &gUnk_02014FC8;
        clear_header->seed = zero_value;
        clear_header->checksum_a = zero_value;
        clear_header->checksum_b = zero_value;

        {
            register int zero_arg asm("r0");
            register u8 * packed_base asm("r1");
            register int * width_init asm("r2");

            packed_base = gBuf_2014F28;
            width_init = &gUnk_02014EEC;
            asm("" : "+r"(packed_base), "+r"(width_init));
            bit_width = width_init;
            header = clear_header;
            zero_arg = zero;
            asm("" : "+r"(zero_arg));
            cursor = (u8 *)(zero_arg + (int)packed_base);
        }
        asm("" : "+r"(cursor), "+r"(header), "+r"(bit_width));

        do
        {
            bucket = i % 3;

            if (bucket == zero_value)
            {
                register int * width_read asm("r2");
                register u16 * field asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= 1;
                bits <<= (i / 3);
                field = &header->seed;
                bits |= *field;
                *field = bits;
                asm("" : "+r"(header));
            }
            else if (bucket == 1)
            {
                register int * width_read asm("r2");
                register volatile u16 * field asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= bucket;
                bits <<= (i / 3);
                field = &header->checksum_a;
                bits |= *field;
                *field = bits;
                asm("" : "+r"(bucket));
            }
            else
            {
                register int * width_read asm("r2");
                register u16 * field asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= 1;
                bits <<= (i / 3);
                field = &header->checksum_b;
                bits |= *field;
                *field = bits;
            }

            i++;

            {
                register int * width_read asm("r2");

                width_read = bit_width;

                if (i % *width_read == zero_value)
                    cursor++;
            }
        } while (i != 0x1e);
    }
}
