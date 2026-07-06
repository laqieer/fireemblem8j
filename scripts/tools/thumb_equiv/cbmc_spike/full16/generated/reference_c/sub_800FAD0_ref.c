u16 NextRN_N(u16);                                  /* extern */

s32 GetUnitDefinitionFormEventScr(void *arg0, s16 arg1, u8 arg2, s8 arg3, s32 arg4) {
    s32 sp40;
    s32 sp44;
    void *sp48;
    s32 sp4C;
    s32 sp50;
    s16 temp_r1;
    s32 var_r0;
    s32 var_r0_2;
    s8 *var_r6;
    s8 var_r3;
    u16 var_r3_4;
    u16 var_sb;
    u32 var_r3_2;
    u32 var_r3_3;
    u8 temp_r2;
    u8 temp_r7;
    void *temp_r0;
    void *temp_r0_2;
    void *var_r6_2;

    temp_r1 = arg1;
    temp_r7 = arg2;
    sp40 = (s32) arg3;
    var_sb = 0;
    var_r3 = 0;
    if (temp_r7 != 0) {
        sp48 = arg0;
        if ((s32) temp_r1 > 0) {
            do {
                if (0x40 & M2C_FIELD(sp48, u8 *, 5)) {
                    *(&subroutine_arg0 + var_sb) = var_r3;
                    var_sb += 1;
                }
                sp48 += 0x14;
                var_r3 = (s8) (u16) (var_r3 + 1);
            } while ((s32) var_r3 < (s32) temp_r1);
        }
        var_r3 = (s8) (u16) Div((temp_r7 * var_sb) + 0x32, 0x64);
    }
    sp4C = 0;
    sp50 = 0;
    if (var_r3 != 0) {
        do {
            sp44 = (s32) var_r3;
            temp_r2 = *(&subroutine_arg0 + NextRN_N(var_sb));
            if ((u32) temp_r2 <= 0x1FU) {
                var_r0 = (1 << temp_r2) & sp4C;
            } else {
                var_r0 = (1 << (temp_r2 - 0x20)) & sp50;
            }
            if (var_r0 == 0) {
                if ((u32) temp_r2 <= 0x1FU) {
                    sp4C |= 1 << temp_r2;
                } else {
                    sp50 |= 1 << (temp_r2 - 0x20);
                }
                var_r3 = (s8) (u16) (var_r3 - 1);
            }
        } while (var_r3 != 0);
    }
    sp48 = arg0;
    var_r6 = (s8 *)0x0203EFB4;
    var_r3_2 = 0;
    if ((s32) temp_r1 > 0) {
        do {
            if (var_r3_2 <= 0x1FU) {
                var_r0_2 = (1 << var_r3_2) & sp4C;
            } else {
                var_r0_2 = (1 << (var_r3_2 - 0x20)) & sp50;
            }
            if (var_r0_2 == 0) {
                temp_r0 = (var_r3_2 * 0x14) + sp48;
                M2C_FIELD(var_r6, s32 *, 0) = (s32) M2C_FIELD(temp_r0, s32 *, 0);
                M2C_FIELD(var_r6, s32 *, 4) = (s32) M2C_FIELD(temp_r0, s32 *, 4);
                M2C_FIELD(var_r6, s32 *, 8) = (s32) M2C_FIELD(temp_r0, s32 *, 8);
                M2C_FIELD(var_r6, s32 *, 0xC) = (s32) M2C_FIELD(temp_r0, s32 *, 0xC);
                M2C_FIELD((var_r6 + 0xC), s32 *, 4) = (s32) M2C_FIELD((temp_r0 + 0xC), s32 *, 4);
                M2C_FIELD(var_r6, u8 *, 5) = (u8) (-0x41 & M2C_FIELD(var_r6, u8 *, 5));
                var_r6 += 0x14;
            }
            var_r3_2 = (u32) (u16) (var_r3_2 + 1);
        } while ((s32) var_r3_2 < (s32) temp_r1);
    }
    var_r3_3 = 0;
    if ((s32) temp_r1 > 0) {
        do {
            if (var_r3_3 <= 0x1FU) {
                if (!((1 << var_r3_3) & sp4C)) {

                } else {
                    goto block_32;
                }
            } else if ((1 << (var_r3_3 - 0x20)) & sp50) {
block_32:
                temp_r0_2 = (var_r3_3 * 0x14) + sp48;
                M2C_FIELD(var_r6, s32 *, 0) = (s32) M2C_FIELD(temp_r0_2, s32 *, 0);
                M2C_FIELD(var_r6, s32 *, 4) = (s32) M2C_FIELD(temp_r0_2, s32 *, 4);
                M2C_FIELD(var_r6, s32 *, 8) = (s32) M2C_FIELD(temp_r0_2, s32 *, 8);
                M2C_FIELD(var_r6, s32 *, 0xC) = (s32) M2C_FIELD(temp_r0_2, s32 *, 0xC);
                M2C_FIELD((var_r6 + 0xC), s32 *, 4) = (s32) M2C_FIELD((temp_r0_2 + 0xC), s32 *, 4);
                M2C_FIELD(var_r6, u8 *, 5) = (u8) (M2C_FIELD(var_r6, u8 *, 5) | 0x40);
                var_r6 += 0x14;
            }
            var_r3_3 = (u32) (u16) (var_r3_3 + 1);
        } while ((s32) var_r3_3 < (s32) temp_r1);
    }
    *var_r6 = 0;
    if ((s8) arg4 == 1) {
        var_r6_2 = (void *)0x0203EFB4;
        var_r3_4 = 0;
        if ((s32) temp_r1 > 0) {
            do {
                M2C_FIELD(var_r6_2, s8 *, 7) = 0;
                M2C_FIELD(var_r6_2, s32 *, 8) = 0;
                var_r6_2 += 0x14;
                var_r3_4 += 1;
            } while ((s32) var_r3_4 < (s32) temp_r1);
        }
    }
    if (sp40 == 1) {
        BuildDeployedUnitDefinitionList((struct UnitDefinition *)0x0203EFB4);
    }
    return 0x0203EFB4;
}
/* Warning: struct UnitDefinition is not defined (only forward-declared) */
