void AddAttr2dBitMap(u8 *arg0, void *arg1, s16 arg2, s16 arg3, s32 arg4) {
    u8 *temp_r4;
    u8 *var_r1_2;
    u8 *var_r2_2;
    s16 temp_ip;
    s16 temp_r8;
    s16 var_r1;
    s16 var_r1_3;
    s16 var_r2;
    s16 var_r3;
    s16 var_r4;
    s16 var_r5;
    s16 var_r6;
    s32 var_r0;
    u8 *var_r3_2;
    void *var_r7;

    var_r1 = arg2;
    var_r3 = arg3;
    var_r6 = M2C_FIELD(arg1, u8 *, 0) + 1;
    var_r2 = M2C_FIELD(arg1, u8 *, 1) + 1;
    temp_ip = var_r6;
    temp_r8 = var_r2;
    var_r4 = 0;
    var_r5 = 0;
    if ((s32) (var_r1 + var_r6) > 0x20) {
        var_r6 = 0x20 - var_r1;
    }
    if ((s32) var_r1 < 0) {
        var_r5 = 0 - var_r1;
        var_r6 -= var_r5;
        var_r1 = 0;
    }
    if ((s32) var_r6 > 0) {
        if ((s32) (var_r3 + var_r2) > 0x20) {
            var_r2 = 0x20 - var_r3;
        }
        if ((s32) var_r3 < 0) {
            var_r4 = 0 - var_r3;
            var_r2 -= var_r4;
            var_r3 = 0;
        }
        if ((s32) var_r2 > 0) {
            var_r7 = arg1 + 2 + ((temp_r8 - (var_r4 + var_r2)) * temp_ip * 2);
            var_r1_2 = (((var_r3 + var_r2) - 1) << 6) + arg0 + (var_r1 * 2);
            var_r0 = var_r2 - 1;
            if (var_r0 >= 0) {
                do {
                    var_r2_2 = var_r1_2;
                    var_r3_2 = var_r7 + (var_r5 * 2);
                    temp_r4 = var_r2_2 - 0x40;
                    if ((s32) var_r6 > 0) {
                        var_r1_3 = var_r6;
                        do {
                            *(u16 *)var_r2_2 = *(u16 *)var_r3_2 + (u16) arg4;
                            var_r3_2 += 2;
                            var_r2_2 += 2;
                            var_r1_3 -= 1;
                        } while (var_r1_3 != 0);
                    }
                    var_r7 += temp_ip * 2;
                    var_r1_2 = temp_r4;
                    var_r0 -= 1;
                } while (var_r0 >= 0);
            }
        }
    }
}
