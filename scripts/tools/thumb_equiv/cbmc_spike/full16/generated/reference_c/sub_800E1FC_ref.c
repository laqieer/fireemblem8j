M2C_UNK EventEndFade();                             /* extern */
M2C_UNK EventStartFade();                           /* extern */
M2C_UNK NewEventFadefx(u16, s32, s32, s32, s32, void *); /* extern */

s32 Event18_ColorFade(void *arg0, M2C_UNK arg3) {
    s32 sp8;
    s32 spC;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r2;
    s32 temp_r4;
    s32 var_r2;
    s32 var_r3;
    s32 var_r6;
    s8 var_r5;
    u16 temp_r2_2;
    u16 var_sb;
    void *temp_r0;

    temp_r0 = M2C_FIELD(arg0, void **, 0x38);
    temp_r2 = 0xF & M2C_FIELD(temp_r0, u8 *, 0);
    var_r5 = (s8) M2C_FIELD(temp_r0, u16 *, 2);
    temp_r4 = (s32) (M2C_FIELD(temp_r0, u16 *, 2) << 0x10) >> 0x18;
    var_sb = M2C_FIELD(temp_r0, u16 *, 4);
    sp8 = (s32) M2C_FIELD(temp_r0, u16 *, 6);
    spC = (s32) M2C_FIELD(temp_r0, u16 *, 8);
    switch (temp_r2) {                              /* irregular */
    case 0:
        EventStartFade();
        return 2;
    case 1:
        EventEndFade();
        return 2;
    case 2:
        temp_r2_2 = M2C_FIELD(arg0, u16 *, 0x3C);
        if (((temp_r2_2 >> 2) & 1) || (0x100 & temp_r2_2)) {
            var_sb = 0;
        }
        var_r6 = 0;
        if (temp_r4 > 0) {
            var_r3 = (var_r5 << 0x18) + 0x01000000;
            var_r2 = (temp_r4 << 0x18) - 0x01000000;
            do {
                var_r6 |= 1 << var_r5;
                temp_r0_2 = var_r2;
                var_r2 += 0xFF000000;
                temp_r0_3 = var_r3 >> 0x18;
                var_r3 += 0x01000000;
                var_r5 = (s8) temp_r0_3;
            } while ((s32) (temp_r0_2 >> 0x18) > 0);
        }
        NewEventFadefx(var_sb, var_r6, sp8, spC, (s32) M2C_FIELD(temp_r0, u16 *, 0xA), arg0);
        return 2;
    default:
        return 6;
    }
}
