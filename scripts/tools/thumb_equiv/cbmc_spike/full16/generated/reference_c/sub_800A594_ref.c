M2C_UNK SplineEvalCatmullRom(s32 *, void *, u16 *, u32, s32); /* extern */
u32 sub_80D6384(s32, u32);                          /* extern */

s32 SplineSampleAtTime(void *arg0, s32 arg1, u32 arg2, void *arg3, s32 arg4) {
    s32 sp4;
    s32 sp8;
    s32 spC;
    u16 sp1C;
    s32 sp2C;
    u32 sp30;
    void *sp34;
    void *sp38;
    s32 *var_r1;
    s32 *var_r1_3;
    s32 *var_r1_4;
    s32 *var_r3_2;
    s32 *var_r4_2;
    s32 *var_r4_3;
    s32 *var_r5;
    s32 *var_r5_4;
    s32 temp_r0_5;
    s32 temp_r1;
    s32 temp_r2;
    s32 temp_r4;
    s32 var_r2;
    s32 var_r2_2;
    s32 var_r2_3;
    s32 var_r2_4;
    s32 var_r6;
    s32 var_r6_2;
    s32 var_sb;
    u16 *var_r4;
    u16 *var_r4_4;
    u16 *var_r5_2;
    u16 *var_r5_3;
    u32 temp_r0;
    u32 temp_r3;
    u32 temp_r3_2;
    void *temp_r0_2;
    void *temp_r0_3;
    void *temp_r0_4;
    void *temp_r0_6;
    void *var_r1_2;
    void *var_r3;
    void *var_r3_3;
    void *var_r3_4;

    sp2C = arg1;
    sp30 = arg2;
    sp34 = arg3;
    if ((arg4 << 0x18) != 0) {
        temp_r4 = arg1 * 8;
        temp_r0 = sub_80D6384(M2C_FIELD(((temp_r4 + arg0) - 8), u16 *, 4) << 0xC, arg2);
        sp30 = temp_r0;
        temp_r3 = temp_r0 >> 0xC;
        var_sb = 0;
        temp_r2 = sp2C - 2;
        sp38 = &subroutine_arg0 + 0x24;
        if ((temp_r2 > 0) && ((temp_r3 < (u32) M2C_FIELD(arg0, u16 *, 4)) || (temp_r3 >= (u32) M2C_FIELD(arg0, u16 *, 0xC)))) {
loop_4:
            var_sb += 1;
            if (var_sb < temp_r2) {
                temp_r0_2 = (var_sb * 8) + arg0;
                if ((temp_r3 < (u32) M2C_FIELD(temp_r0_2, u16 *, 4)) || (temp_r3 >= (u32) M2C_FIELD(temp_r0_2, u16 *, 0xC))) {
                    goto loop_4;
                }
            }
        }
        if (var_sb == 0) {
            temp_r0_3 = temp_r4 + arg0;
            temp_r1 = M2C_FIELD((temp_r0_3 - 8), u16 *, 4) - M2C_FIELD((temp_r0_3 - 0x10), u16 *, 4);
            temp_r0_4 = (temp_r2 * 8) + arg0;
            sp4 = (s32) M2C_FIELD(temp_r0_4, s16 *, 0);
            sp8 = (s32) M2C_FIELD(temp_r0_4, s16 *, 2);
            sp1C = (u16) var_sb;
            var_r6 = 0;
            var_r4 = &sp1C + 2;
            var_r1 = &sp8 + 8;
            var_r5 = &spC;
            var_r3 = arg0;
            var_r2 = 1;
            do {
                *var_r5 = (s32) M2C_FIELD(var_r3, s16 *, 0);
                *var_r1 = (s32) M2C_FIELD(var_r3, s16 *, 2);
                *var_r4 = M2C_FIELD(var_r3, u16 *, 4) + temp_r1;
                if (var_r6 < (s32) (sp2C - 1)) {
                    var_r3 += 8;
                    var_r6 += 1;
                }
                var_r4 += 2;
                var_r1 += 8;
                var_r5 += 8;
                var_r2 -= 1;
            } while (var_r2 >= 0);
            sp30 += temp_r1 << 0xC;
        } else {
            var_r5_2 = &sp1C;
            var_r4_2 = &sp8;
            var_r3_2 = &sp4;
            var_r1_2 = ((var_sb - 1) * 8) + arg0;
            var_r2_2 = 2;
            do {
                *var_r3_2 = (s32) M2C_FIELD(var_r1_2, s16 *, 0);
                *var_r4_2 = (s32) M2C_FIELD(var_r1_2, s16 *, 2);
                *var_r5_2 = M2C_FIELD(var_r1_2, u16 *, 4);
                var_r1_2 += 8;
                var_r5_2 += 2;
                var_r4_2 += 8;
                var_r3_2 += 8;
                var_r2_2 -= 1;
            } while (var_r2_2 >= 0);
        }
    } else {
        temp_r3_2 = sp30 >> 0xC;
        var_sb = 0;
        temp_r0_5 = sp2C - 1;
        sp38 = &subroutine_arg0 + 0x24;
        if ((temp_r0_5 > 0) && ((temp_r3_2 < (u32) M2C_FIELD(arg0, u16 *, 4)) || (temp_r3_2 >= (u32) M2C_FIELD(arg0, u16 *, 0xC)))) {
loop_19:
            var_sb += 1;
            if (var_sb < temp_r0_5) {
                temp_r0_6 = (var_sb * 8) + arg0;
                if ((temp_r3_2 < (u32) M2C_FIELD(temp_r0_6, u16 *, 4)) || (temp_r3_2 >= (u32) M2C_FIELD(temp_r0_6, u16 *, 0xC))) {
                    goto loop_19;
                }
            }
        }
        if (var_sb == 0) {
            var_r2_3 = 0;
            var_r5_3 = &sp1C;
            var_r4_3 = &sp8;
            var_r1_3 = &sp4;
            var_r3_3 = arg0;
            do {
                *var_r1_3 = (s32) M2C_FIELD(var_r3_3, s16 *, 0);
                *var_r4_3 = (s32) M2C_FIELD(var_r3_3, s16 *, 2);
                *var_r5_3 = M2C_FIELD(var_r3_3, u16 *, 4);
                if (var_r2_3 < temp_r0_5) {
                    var_r3_3 += 8;
                }
                var_r5_3 += 2;
                var_r4_3 += 8;
                var_r1_3 += 8;
                var_r2_3 += 1;
            } while (var_r2_3 <= 2);
        } else {
            var_r6_2 = var_sb - 1;
            var_r4_4 = &sp1C;
            var_r1_4 = &sp8;
            var_r5_4 = &sp4;
            var_r3_4 = (var_r6_2 * 8) + arg0;
            var_r2_4 = 2;
            do {
                *var_r5_4 = (s32) M2C_FIELD(var_r3_4, s16 *, 0);
                *var_r1_4 = (s32) M2C_FIELD(var_r3_4, s16 *, 2);
                *var_r4_4 = M2C_FIELD(var_r3_4, u16 *, 4);
                if (var_r6_2 < temp_r0_5) {
                    var_r3_4 += 8;
                    var_r6_2 += 1;
                }
                var_r4_4 += 2;
                var_r1_4 += 8;
                var_r5_4 += 8;
                var_r2_4 -= 1;
            } while (var_r2_4 >= 0);
        }
    }
    SplineEvalCatmullRom(&sp4, sp38, &sp1C, sp30, 3);
    M2C_FIELD(sp34, s16 *, 0) = (s16) sp24;
    M2C_FIELD(sp34, s16 *, 2) = (s16) M2C_FIELD(sp38, s32 *, 4);
    return var_sb;
}
