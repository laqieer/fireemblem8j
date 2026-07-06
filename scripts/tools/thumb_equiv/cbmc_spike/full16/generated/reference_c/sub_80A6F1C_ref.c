u16 sub_80A6AA8();                                  /* extern */
u16 sub_80A6C20(s32, u16);                          /* extern */
M2C_UNK sub_80A6D34();                              /* extern */

s32 DecodeAndVerifyArenaRecord(M2C_UNK (*arg0)(s32 *, s32)) {
    s32 sp4;
    s32 var_r5;
    u16 temp_r6;
    void *temp_r2;

    sp4 = 0;
    sub_80A6D34();
    *(s32 *)0x02014F24 = (s32) M2C_FIELD((void *)0x02014FC8, u16 *, 0);
    temp_r6 = sub_80A6C20(*(s32 *)0x02014EF4 + 0x02014F28, M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    M2C_FIELD(&subroutine_arg0, u16 *, 0) = sub_80A6AA8();
    var_r5 = 0;
    if ((s32) M2C_FIELD((void *)0x02014FC8, u16 *, 6) > 0) {
        do {
            temp_r2 = var_r5 + *(void *)0x02014EF4;
            M2C_FIELD(temp_r2, u8 *, 0x02014F28) = (u8) (*(s32 *)0x02014EF0 & (M2C_FIELD(temp_r2, u8 *, 0x02014F28) - sub_80A6AA8()));
            var_r5 += 1;
        } while (var_r5 < (s32) M2C_FIELD((void *)0x02014FC8, u16 *, 6));
    }
    M2C_FIELD(&subroutine_arg0, u16 *, 2) = sub_80A6AA8();
    arg0(&sp4, *(void *)0x02014EF4 + 0x02014F28);
    if ((M2C_FIELD((void *)0x02014FC8, u16 *, 2) != ((sub_80A6C20(*(void *)0x02014EF4 + 0x02014F28, M2C_FIELD((void *)0x02014FC8, u16 *, 6)) + M2C_FIELD(&subroutine_arg0, u16 *, 0)) & 0x3FF)) || (M2C_FIELD((void *)0x02014FC8, u16 *, 4) != ((temp_r6 + M2C_FIELD(&subroutine_arg0, u16 *, 2)) & 0x3FF))) {
        return 0;
    }
    return 1;
}
