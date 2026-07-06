s32 AdvanceGetLCGRNValue();                         /* extern */
s32 CanUnitCrossTerrain(s32, u8);                   /* extern */

s32 SelectSummonPos(s32 arg0, s32 arg1, void *arg2) {
    M2C_UNK sp6C;
    s8 sp74;
    s32 sp78;
    void *sp7C;
    s32 sp80;
    s32 sp84;
    s32 sp88;
    void *sp8C;
    M2C_UNK *var_r1;
    s32 temp_r0;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r1;
    s32 temp_r1_2;
    s32 temp_r2;
    s32 var_r2;
    s32 var_r2_2;
    s32 var_r3_2;
    s32 var_r6_2;
    s32 var_r7;
    s32 var_r8;
    s8 *var_r0;
    s8 var_r5;
    s8 var_r5_2;
    s8 var_r6;
    void *temp_r0_4;
    void *var_r3;
    void *var_r4;

    sp78 = arg0;
    sp7C = arg2;
    var_r8 = 0;
    var_r6 = arg1 - 1;
    temp_r1 = arg1 + 2;
    if ((s32) var_r6 < temp_r1) {
        temp_r2 = sp78 + 2;
        sp80 = temp_r1;
        do {
            var_r5 = sp78 - 1;
            sp84 = var_r6 + 1;
            if ((s32) var_r5 < temp_r2) {
                var_r3 = (void *)0x0202E4D0;
                var_r2 = 0xFF;
                var_r7 = var_r8 + 1;
                var_r4 = (var_r8 * 0xC) + &subroutine_arg0;
                do {
                    M2C_FIELD(var_r4, s8 *, 0) = var_r5;
                    M2C_FIELD(var_r4, s8 *, 1) = var_r6;
                    if (((s32) var_r6 >= (s32) M2C_FIELD(var_r3, s16 *, 2)) || ((s32) var_r5 >= (s32) M2C_FIELD(var_r3, s16 *, 0)) || ((s32) var_r6 < 0) || ((s32) var_r5 < 0) || (temp_r1_2 = var_r6 * 4, (*(*(temp_r1_2 + *(s32 *)0x0202E4D4) + var_r5) != 0)) || ((M2C_FIELD((void *)0x0202BCEC, u8 *, 0xD) != 0) && (*(*(temp_r1_2 + *(s32 *)0x0202E4E4) + var_r5) == 0)) || (sp88 = var_r2, sp8C = var_r3, (CanUnitCrossTerrain(0x0203A4E8, *(*(temp_r1_2 + *(s32 *)0x0202E4D8) + var_r5)) == 0))) {
                        M2C_FIELD(var_r4, u8 *, 2) = (u8) (M2C_FIELD(var_r4, u8 *, 2) | var_r2);
                    } else {
                        M2C_FIELD(var_r4, u8 *, 2) = 1U;
                        temp_r0 = var_r7 << 0x18;
                        var_r7 += 1;
                        var_r4 += 0xC;
                        var_r8 = temp_r0 >> 0x18;
                    }
                    var_r5 += 1;
                } while ((s32) var_r5 < temp_r2);
            }
            var_r6 = (s8) sp84;
        } while ((s32) var_r6 < sp80);
    }
    if (var_r8 == 0) {
        return -1;
    }
    var_r0 = &sp74;
    do {
        *var_r0 = 0;
        var_r0 -= 1;
    } while ((s32) var_r0 >= (s32) &sp6C);
    var_r6_2 = 0;
    var_r5_2 = 0;
    if (var_r8 > 0) {
        var_r2_2 = 0x01000000;
        var_r1 = &subroutine_arg0;
        var_r3_2 = 0x01000000;
        do {
            if (M2C_FIELD(var_r1, s8 *, 2) == 1) {
                *(&sp6C + var_r6_2) = var_r5_2;
                temp_r0_2 = var_r3_2 >> 0x18;
                var_r3_2 += 0x01000000;
                var_r6_2 = temp_r0_2;
            }
            temp_r0_3 = var_r2_2;
            var_r2_2 += 0x01000000;
            var_r1 += 0xC;
            var_r5_2 = (s8) (temp_r0_3 >> 0x18);
        } while ((s32) var_r5_2 < var_r8);
    }
    temp_r0_4 = (*((s8) (DivRem(AdvanceGetLCGRNValue(), var_r8 + 1) - 1) + &sp6C) * 0xC) + sp;
    M2C_FIELD(sp7C, s32 *, 0) = (s32) M2C_FIELD(temp_r0_4, s32 *, 0);
    M2C_FIELD(sp7C, s32 *, 4) = (s32) M2C_FIELD(temp_r0_4, s32 *, 4);
    M2C_FIELD(sp7C, s32 *, 8) = (s32) M2C_FIELD(temp_r0_4, s32 *, 8);
    return 1;
}
