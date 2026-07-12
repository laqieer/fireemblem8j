/*
 * Password-header decoder shared with FE6J func_fe6_08083180 and FE7J
 * sub_809E4D0. FE8J uses a full-width mask and 30 packed bits.
 *
 * Matching levers: preserve the FE6/JP value roles with phase-local register
 * declarations; materialize checksum_addr in r0 before loading call_buf; build
 * the byte address from j in r2 before adding the r1 base; keep delta/mask in
 * r1/r0; and read/write each header field through a struct pointer held in r1.
 * Empty constraints preserve lifetimes but emit no opcodes.
 *
 * The pre-promotion source was PROVEN-BOUNDED(3) and EQUIV across 60/60
 * codec-domain trials. The linked ROM is byte-exact at [0x080A6D34,0x080A6E4C).
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
        register int checksum_addr asm("r0");
        int count_value;

        count = &gUnk_02014EF4;
        count_value = *count;
        checksum_addr = count_value;
        asm("" : "+r"(checksum_addr));
        call_buf = gBuf_2014F28;
        checksum_addr += (int)call_buf;
        checksum =
            sub_80A6C20((u8 *)checksum_addr,
                         gUnk_02014FC8.block_count);
        asm("" : "+r"(checksum));
        j = 0;

        if (zero < *count)
        {
            register u8 * loop_base asm("r8");
            register int * mask asm("r6");
            register int at_addr asm("r2");

            loop_base = call_buf;
            mask = &gUnk_02014EF0;
            asm("" : "+r"(loop_base), "+r"(mask));

            do
            {
                register u8 * base_read asm("r1");

                base_read = loop_base;
                asm("" : "+r"(base_read));
                at_addr = j;
                at_addr += (int)base_read;

                {
                    register int delta asm("r1");
                    register int masked asm("r0");

                    delta = *(u8 *)at_addr - checksum;
                    masked = *mask;
                    masked &= delta;
                    *(u8 *)at_addr = masked;
                }
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
                register struct LinkArenaRecordHeader * header_low asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= 1;
                bits <<= (i / 3);
                header_low = header;
                asm("" : "+r"(header_low));
                bits |= header_low->seed;
                header_low->seed = bits;
                asm("" : "+r"(header));
            }
            else if (bucket == 1)
            {
                register int * width_read asm("r2");
                register struct LinkArenaRecordHeader * header_low asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= bucket;
                bits <<= (i / 3);
                header_low = header;
                asm("" : "+r"(header_low));
                bits |= header_low->checksum_a;
                header_low->checksum_a = bits;
                asm("" : "+r"(bucket));
            }
            else
            {
                register int * width_read asm("r2");
                register struct LinkArenaRecordHeader * header_low asm("r1");

                bits = *cursor;
                width_read = bit_width;
                bits >>= (i % *width_read);
                bits &= 1;
                bits <<= (i / 3);
                header_low = header;
                asm("" : "+r"(header_low));
                bits |= header_low->checksum_b;
                header_low->checksum_b = bits;
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
