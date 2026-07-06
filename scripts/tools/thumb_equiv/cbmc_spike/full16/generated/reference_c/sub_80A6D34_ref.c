M2C_UNK sub_80A6AC0();                              /* extern */
u16 sub_80A6C20(s32, u16);                          /* extern */

void sub_80A6D34(void) {
    s32 temp_r0;
    s32 var_r7;
    u16 temp_r5;
    u8 *var_r6;
    void *var_r3;

    var_r7 = 0;
    sub_80A6AC0();
    temp_r5 = sub_80A6C20(*(s32 *)0x02014EF4 + 0x02014F28, M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    var_r3 = NULL;
    if ((s32) *(s32 *)0x02014EF4 > 0) {
        do {
            M2C_FIELD(var_r3, u8 *, 0x02014F28) = (u8) (*(s32 *)0x02014EF0 & (M2C_FIELD(var_r3, u8 *, 0x02014F28) - temp_r5));
            var_r3 += 1;
        } while ((s32) var_r3 < (s32) *(s32 *)0x02014EF4);
    }
    M2C_FIELD((void *)0x02014FC8, u16 *, 0) = 0U;
    M2C_FIELD((void *)0x02014FC8, u16 *, 2) = 0U;
    M2C_FIELD((void *)0x02014FC8, u16 *, 4) = 0U;
    var_r6 = (u8 *)0x02014F28;
    do {
        temp_r0 = var_r7 % 3;
        if (temp_r0 == 0) {
            M2C_FIELD((void *)0x02014FC8, u16 *, 0) = (u16) (((((s32) *var_r6 >> (var_r7 % (s32) *(s32 *)0x02014EEC)) & 1) << (var_r7 / 3)) | M2C_FIELD((void *)0x02014FC8, u16 *, 0));
        } else if (temp_r0 == 1) {
            M2C_FIELD((void *)0x02014FC8, u16 *, 2) = (u16) (((((s32) *var_r6 >> (var_r7 % (s32) *(s32 *)0x02014EEC)) & temp_r0) << (var_r7 / 3)) | M2C_FIELD((void *)0x02014FC8, u16 *, 2));
        } else {
            M2C_FIELD((void *)0x02014FC8, u16 *, 4) = (u16) (((((s32) *var_r6 >> (var_r7 % (s32) *(s32 *)0x02014EEC)) & 1) << (var_r7 / 3)) | M2C_FIELD((void *)0x02014FC8, u16 *, 4));
        }
        var_r7 += 1;
        if ((var_r7 % (s32) *(s32 *)0x02014EEC) == 0) {
            var_r6 += 1;
        }
    } while (var_r7 != 0x1E);
}
