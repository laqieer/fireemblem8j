u16 sub_80A6A7C(s32);                               /* extern */
s32 sub_80A6AA8();                                  /* extern */
u16 sub_80A6C20(s32, u16);                          /* extern */
M2C_UNK sub_80A6C60();                              /* extern */

void sub_80A6E4C(M2C_UNK (*arg0)(s32 *, s32)) {
    s32 sp0;
    s32 var_r5;
    s8 *var_r0;
    u16 temp_r4;
    void *temp_r2;

    sp0 = 0;
    var_r0 = (s8 *)0x02014FC7;
    do {
        *var_r0 = 0;
        var_r0 -= 1;
    } while ((s32) var_r0 >= 0x02014F28);
    arg0(&sp0, *(s32 *)0x02014EF4 + 0x02014F28);
    M2C_FIELD((void *)0x02014FC8, u16 *, 6) = sub_80A6A7C(sp0);
    M2C_FIELD((void *)0x02014FC8, u16 *, 2) = sub_80A6C20(*(s32 *)0x02014EF4 + 0x02014F28, M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    M2C_FIELD((void *)0x02014FC8, u16 *, 0) = (u16) (((GetGameClock() >> 3) + M2C_FIELD((void *)0x02014FC8, u16 *, 2)) & 0x3FF);
    *(s32 *)0x02014F24 = (s32) M2C_FIELD((void *)0x02014FC8, u16 *, 0);
    M2C_FIELD((void *)0x02014FC8, u16 *, 2) = (u16) ((sub_80A6AA8() + M2C_FIELD((void *)0x02014FC8, u16 *, 2)) & 0x3FF);
    var_r5 = 0;
    if ((s32) M2C_FIELD((void *)0x02014FC8, u16 *, 6) > 0) {
        do {
            temp_r2 = var_r5 + *(void *)0x02014EF4;
            M2C_FIELD(temp_r2, u8 *, 0x02014F28) = (u8) (*(s32 *)0x02014EF0 & (sub_80A6AA8() + M2C_FIELD(temp_r2, u8 *, 0x02014F28)));
            var_r5 += 1;
        } while (var_r5 < (s32) M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    }
    temp_r4 = sub_80A6C20(*(void *)0x02014EF4 + 0x02014F28, M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    M2C_FIELD((void *)0x02014FC8, s16 *, 4) = (s16) ((temp_r4 + sub_80A6AA8()) & 0x3FF);
    sub_80A6C60();
}
