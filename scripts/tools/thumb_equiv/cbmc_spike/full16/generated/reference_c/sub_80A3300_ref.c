M2C_UNK PutSpriteExt(s32, s32, u8, s32, s32);       /* extern */

void sub_80A3300(void *arg0) {
    u8 *sp4;
    s32 var_r4;
    s32 var_r5;
    s32 var_r8;
    u8 *temp_r3;
    u8 temp_r6;
    void *temp_r1;

    if (M2C_FIELD(arg0, u8 *, 0x3B) != 0) {
        var_r8 = 0;
        temp_r1 = arg0 + 0x34;
        sp4 = arg0 + 0x3E;
        do {
            temp_r3 = temp_r1 + var_r8;
            if (*temp_r3 != 0xFF) {
                temp_r6 = M2C_FIELD(arg0, s16 *, 0x54) + ((var_r8 * 0x10) + 0x19);
                var_r5 = 0;
                if ((s32) *temp_r3 >= 0) {
                    var_r4 = (M2C_FIELD(arg0, s16 *, 0x52) + 0x34) & 0x1FF;
                    do {
                        PutSpriteExt(0xD, var_r4, temp_r6, M2C_FIELD((var_r5 * 4), s32 *, 0x08A95478), 0xF380);
                        var_r4 += 0xA;
                        var_r5 += 1;
                    } while (var_r5 <= (s32) *(temp_r1 + var_r8));
                }
            }
            var_r8 += 1;
        } while (var_r8 <= 4);
        if (*sp4 != 0) {
            PutSpriteExt(0xD, (M2C_FIELD(arg0, s16 *, 0x52) + 0xC0) & 0x1FF, (u8) (M2C_FIELD(arg0, s16 *, 0x54) + 0x1C), *(s32 *)0x08A95478, 0xF380);
        }
    }
}
