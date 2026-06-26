typedef unsigned char u8; typedef unsigned short u16; typedef signed char s8;
typedef signed short s16; typedef unsigned int u32; typedef signed int s32;
struct Foo { u16 field0; u16 field2; u16 field4; u16 count; };
extern void sub_80A6D34(void);
extern u16 sub_80A6C20(u8 *buf, int count);
extern int sub_80A6AA8(void);
extern struct Foo gFoo;          /* 0x02014FC8 */
extern u32 gWord_2014F24;        /* 0x02014F24 */
extern u32 gWord_2014EF4;        /* 0x02014EF4 */
extern u8 gBuf_2014F28[];        /* 0x02014F28 */
extern u32 gWord_2014EF0;        /* 0x02014EF0 */
int sub_80A6F1C(void (*func)(u32 *, u8 *)) {
    u16 local[2]; u32 zero; u16 sumA; int i; u8 *base;
    zero = 0; sub_80A6D34();
    gWord_2014F24 = gFoo.field0;
    base = gBuf_2014F28;
    sumA = sub_80A6C20(base + gWord_2014EF4, gFoo.count);
    local[0] = sub_80A6AA8();
    for (i = 0; i < gFoo.count; i++) {
        base[gWord_2014EF4 + i] = (base[gWord_2014EF4 + i] - sub_80A6AA8()) & gWord_2014EF0;
    }
    local[1] = sub_80A6AA8();
    func(&zero, base + gWord_2014EF4);
    if (gFoo.field2 != ((sub_80A6C20(base + gWord_2014EF4, gFoo.count) + local[0]) & 0x3FF)) return 0;
    if (gFoo.field4 == ((sumA + local[1]) & 0x3FF)) return 1;
    return 0;
}