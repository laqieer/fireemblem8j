typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;

extern void sub_80A6AC0(void);
extern u16 sub_80A6C20(u8 *buf, int len);

/* fixed-RAM augury/divination state (confirmed via caller sub_80A6F1C):
   0x02014EEC = int divisor   (bits-per-source-byte, re-read each iter)
   0x02014EF0 = int mask      (per-byte AND mask)
   0x02014EF4 = int count     (length of the shuffled prefix)
   0x02014F28 = u8  buf[]      (the code buffer)
   0x02014FC8 = struct { u16 a,b,c,n; } : a/b/c = 3 packed 10-bit fields,
                                          n (+6) = checksum length arg     */
struct Bits3 { u16 a; u16 b; u16 c; u16 n; };

void sub_80A6D34(void)
{
    int i, j, k, sub, r;
    u8 *buf = (u8 *)0x02014F28;
    int *count = (int *)0x02014EF4;
    int *mask = (int *)0x02014EF0;
    struct Bits3 *bits = (struct Bits3 *)0x02014FC8;
    u8 *p;

    k = 0;
    i = 0;

    sub_80A6AC0();

    sub = sub_80A6C20(buf + *count, bits->n);

    for (j = k; j < *count; j++)
        buf[j] = (buf[j] - sub) & *mask;

    bits->a = 0;
    bits->b = 0;
    bits->c = 0;

    p = buf + k;
    do
    {
        r = i % 3;
        if (r == 0)
            bits->a |= (((*p >> (i % *(int *)0x02014EEC)) & 1) << (i / 3));
        else if (r == 1)
            bits->b |= (((*p >> (i % *(int *)0x02014EEC)) & r) << (i / 3));
        else
            bits->c |= (((*p >> (i % *(int *)0x02014EEC)) & 1) << (i / 3));
        i++;
        if (i % *(int *)0x02014EEC == 0)
            p++;
    } while (i != 30);
}