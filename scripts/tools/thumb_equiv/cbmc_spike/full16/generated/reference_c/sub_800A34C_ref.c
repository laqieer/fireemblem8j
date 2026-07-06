M2C_UNK sub_800A194(s32 *, s32 *, M2C_UNK *, void *, s32); /* extern */

void SplineEvalCatmullRom(void *arg0, void *arg1, void *arg2, u32 arg3, s32 arg4) {
    M2C_UNK sp4;
    s32 sp14;
    s32 sp24;
    s32 sp34;
    void *sp54;
    void *sp58;
    u32 sp5C;
    s32 sp60;
    s32 sp64;
    s32 sp68;
    void *sp6C;
    void *sp70;
    s32 *sp74;
    s32 *var_r5;
    s32 temp_r0_4;
    s32 temp_r0_5;
    s32 temp_r1;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r1_5;
    s32 temp_r2;
    s32 temp_r2_2;
    s32 temp_r3_2;
    s32 temp_r5;
    s32 temp_r5_3;
    s32 temp_r5_5;
    s32 temp_r6;
    s32 temp_r6_2;
    s32 temp_r7;
    s32 temp_r8;
    s32 var_r4;
    u16 temp_r2_3;
    u32 temp_r0_3;
    u32 temp_r3;
    void *temp_r0;
    void *temp_r0_2;
    void *temp_r1_2;
    void *temp_r4;
    void *temp_r5_2;
    void *temp_r5_4;
    void *var_r3;

    sp54 = arg1;
    sp58 = arg2;
    sp5C = arg3;
    temp_r3 = arg3 >> 0xC;
    sp60 = 0;
    temp_r1 = arg4 - 1;
    sp6C = &subroutine_arg0 + 0x34;
    sp70 = &subroutine_arg0 + 0x38;
    if ((temp_r1 > 0) && ((temp_r3 < (u32) M2C_FIELD(sp58, u16 *, 0)) || (temp_r3 >= (u32) M2C_FIELD(sp58, u16 *, 2)))) {
loop_3:
        temp_r2 = sp60 + 1;
        sp60 = temp_r2;
        if (temp_r2 < temp_r1) {
            temp_r0 = (temp_r2 * 2) + sp58;
            if ((temp_r3 < (u32) M2C_FIELD(temp_r0, u16 *, 0)) || (temp_r3 >= (u32) M2C_FIELD(temp_r0, u16 *, 2))) {
                goto loop_3;
            }
        }
    }
    sp14 = 0x2000;
    sp24 = 0x1000;
    sp34 = 0 - ((M2C_FIELD(arg0, s32 *, 0) - M2C_FIELD(arg0, s32 *, 8)) * 3);
    var_r3 = arg0;
    M2C_FIELD(sp6C, s32 *, 4) = (s32) (0 - ((M2C_FIELD(var_r3, s32 *, 4) - M2C_FIELD(var_r3, s32 *, 0xC)) * 3));
    var_r4 = 1;
    temp_r5 = arg4 - 1;
    sp68 = arg4 * 8;
    if (temp_r5 > 1) {
        var_r5 = sp6C + 8;
        sp74 = &subroutine_arg0 + 8;
        do {
            *sp74 = 0x1000;
            sp74 += 4;
            (&sp14)[var_r4] = 0x4000;
            (&sp24)[var_r4] = 0x1000;
            *var_r5 = 0 - ((M2C_FIELD(var_r3, s32 *, 0) - M2C_FIELD(var_r3, s32 *, 0x10)) * 3);
            *(sp70 + (var_r4 * 8)) = 0 - ((M2C_FIELD(var_r3, s32 *, 4) - M2C_FIELD(var_r3, s32 *, 0x14)) * 3);
            var_r3 += 8;
            var_r5 += 8;
            var_r4 += 1;
        } while (var_r4 < temp_r5);
    }
    M2C_FIELD(&(&subroutine_arg0)[temp_r5], s32 *, 4) = 0x1000;
    (&sp14)[temp_r5] = 0x2000;
    temp_r2_2 = temp_r5 * 8;
    temp_r0_2 = sp68 + arg0;
    temp_r5_2 = temp_r0_2 - 0x10;
    temp_r4 = temp_r0_2 - 8;
    *(sp6C + temp_r2_2) = 0 - ((M2C_FIELD(temp_r5_2, s32 *, 0) - M2C_FIELD(temp_r4, s32 *, 0)) * 3);
    *(sp70 + temp_r2_2) = 0 - ((M2C_FIELD(temp_r5_2, s32 *, 4) - M2C_FIELD(temp_r4, s32 *, 4)) * 3);
    sub_800A194(&sp14, &sp24, &sp4, sp6C, arg4);
    if (sp60 < temp_r5) {
        temp_r1_2 = (sp60 * 2) + sp58;
        temp_r2_3 = M2C_FIELD(temp_r1_2, u16 *, 0);
        temp_r0_3 = (u32) (sp5C - (temp_r2_3 << 0xC)) / (u32) (M2C_FIELD(temp_r1_2, u16 *, 2) - temp_r2_3);
        temp_r5_3 = sp60 * 8;
        temp_r5_4 = temp_r5_3 + arg0;
        temp_r7 = M2C_FIELD(temp_r5_4, s32 *, 0);
        temp_r1_3 = M2C_FIELD(temp_r5_4, s32 *, 8);
        temp_r0_4 = *(sp6C + temp_r5_3);
        temp_r3_2 = (sp60 + 1) * 8;
        temp_r6 = *(sp6C + temp_r3_2);
        sp64 = M2C_FIELD(temp_r5_4, s32 *, 4);
        temp_r0_5 = M2C_FIELD(temp_r5_4, s32 *, 0xC);
        temp_r1_4 = *(temp_r5_3 + sp70);
        temp_r8 = temp_r1_4;
        temp_r1_5 = *(sp70 + temp_r3_2);
        temp_r6_2 = ((sp64 - temp_r0_5) * 2) + temp_r8 + temp_r1_5;
        temp_r5_5 = (((temp_r0_5 - sp64) * 3) - (temp_r8 * 2)) - temp_r1_5;
        M2C_FIELD(sp54, s32 *, 0) = (s32) (DivArm(0x1000, (DivArm(0x1000, (DivArm(0x1000, (((temp_r7 - temp_r1_3) * 2) + temp_r0_4 + temp_r6) * temp_r0_3) + ((((temp_r1_3 - temp_r7) * 3) - (temp_r0_4 * 2)) - temp_r6)) * temp_r0_3) + temp_r0_4) * temp_r0_3) + temp_r7);
        M2C_FIELD(sp54, s32 *, 4) = (s32) (DivArm(0x1000, (DivArm(0x1000, (DivArm(0x1000, temp_r6_2 * temp_r0_3) + temp_r5_5) * temp_r0_3) + temp_r8) * temp_r0_3) + sp64);
        return;
    }
    M2C_FIELD(sp54, s32 *, 0) = (s32) M2C_FIELD(temp_r4, s32 *, 0);
    M2C_FIELD(sp54, s32 *, 4) = (s32) M2C_FIELD(temp_r4, s32 *, 4);
}
