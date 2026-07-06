M2C_UNK AP_Update(s32, s32, u8);                    /* extern */
s32 GmapScreen2_GetNodeScreenPos(void *, s16, s16, M2C_UNK *, void *); /* extern */
M2C_UNK PutSpriteExt(s32, s16, s16, s32, s32);      /* extern */

void GmapScreen2_Loop(void *arg0, M2C_UNK arg3) {
    M2C_UNK sp4;
    u16 sp8;
    u32 spC;
    u8 *sp10;
    s16 temp_r0_3;
    s32 temp_r0;
    s32 var_r0_2;
    s32 var_r8;
    u8 temp_r0_2;
    u8 temp_r2;
    u8 temp_r3;
    u8 temp_r3_2;
    u8 var_r0;
    u8 var_r0_3;
    u8 var_r6;
    void *temp_r1;
    void *temp_r5;
    void *temp_r5_2;
    void *temp_r6;
    void *temp_r6_2;

    if (!(1 & M2C_FIELD(arg0, u8 *, 0x32))) {
        return;
    }
    spC = (u32) M2C_FIELD(arg0, u32 *, 0x2C) >> 5;
    var_r8 = 0;
    sp10 = arg0 + 0x32;
    do {
        temp_r2 = M2C_FIELD(((var_r8 * 4) + 0x03005270), u8 *, 0x30);
        if (1 & temp_r2) {
            temp_r6 = (var_r8 << 5) + 0x081F5D7C;
            if (2 & temp_r2) {
                var_r0 = M2C_FIELD(temp_r6, u8 *, 2);
            } else {
                var_r0 = M2C_FIELD(temp_r6, u8 *, 3);
            }
            temp_r0 = var_r0 * 0x10;
            temp_r5 = temp_r0 + 0x081F5C6C;
            if ((GmapScreen2_GetNodeScreenPos(M2C_FIELD(arg0, void **, 0x3C), (s16) (M2C_FIELD(temp_r6, u16 *, 0x18) - M2C_FIELD(temp_r5, s8 *, 8)), (s16) (M2C_FIELD(temp_r6, u16 *, 0x1A) - M2C_FIELD(temp_r5, s8 *, 9)), &sp4, &subroutine_arg0 + 6) << 0x18) != 0) {
                M2C_FIELD(&sp4, u16 *, 0) = (u16) (M2C_FIELD(&sp4, u16 *, 0) & 0x1FF);
                temp_r3 = M2C_FIELD(&subroutine_arg0, u8 *, 6);
                M2C_FIELD(&subroutine_arg0, u8 *, 6) = (s16) temp_r3;
                var_r0_2 = var_r8;
                if (var_r0_2 < 0) {
                    var_r0_2 += 0x1F;
                }
                if (*(arg0 + 0x34 + ((var_r0_2 >> 5) * 4)) & (1 << (0x1F & var_r8))) {
                    M2C_FIELD(&subroutine_arg0, u8 *, 6) = (s16) (temp_r3 | 0x400);
                }
                PutSpriteExt(0xC, (s16) M2C_FIELD(&sp4, u16 *, 0), (s16) M2C_FIELD(&subroutine_arg0, u8 *, 6), M2C_FIELD(temp_r5, s32 *, 4), spC + M2C_FIELD(temp_r0, u16 *, 0x081F5C6C) + ((0xF & M2C_FIELD(arg0, u8 *, 0x30)) << 0xC) + 0x800);
            }
        }
        var_r8 += 1;
    } while (var_r8 <= 0x1C);
    if (2 & *sp10) {
        temp_r0_2 = M2C_FIELD(arg0, u8 *, 0x33);
        temp_r6_2 = (temp_r0_2 << 5) + 0x081F5D7C;
        if (2 & M2C_FIELD(((temp_r0_2 * 4) + 0x03005270), u8 *, 0x30)) {
            var_r0_3 = M2C_FIELD(temp_r6_2, u8 *, 2);
        } else {
            var_r0_3 = M2C_FIELD(temp_r6_2, u8 *, 3);
        }
        temp_r5_2 = (var_r0_3 * 0x10) + 0x081F5C6C;
        temp_r1 = M2C_FIELD(arg0, void **, 0x3C);
        sp8 = M2C_FIELD(temp_r1, u16 *, 0x34);
        M2C_FIELD(&subroutine_arg0, u16 *, 0xA) = (u16) M2C_FIELD(temp_r1, u16 *, 0x36);
        M2C_FIELD(&sp4, u16 *, 0) = (u16) ((M2C_FIELD(temp_r5_2, s8 *, 0xC) + (M2C_FIELD(temp_r6_2, u16 *, 0x18) - M2C_FIELD(temp_r5_2, s8 *, 8))) - sp8);
        temp_r0_3 = (M2C_FIELD(temp_r5_2, s8 *, 0xD) + (M2C_FIELD(temp_r6_2, u16 *, 0x1A) - M2C_FIELD(temp_r5_2, s8 *, 9))) - M2C_FIELD(&subroutine_arg0, u16 *, 0xA);
        M2C_FIELD(&sp4, s16 *, 2) = temp_r0_3;
        if (((u32) (u16) (temp_r0_3 + 0x20) <= 0xDFU) && ((u32) ((M2C_FIELD(&sp4, u16 *, 0) + 0x20) << 0x10) <= 0x012F0000U)) {
            var_r6 = (u8) M2C_FIELD(&sp4, s16 *, 2);
            temp_r3_2 = M2C_FIELD(arg0, u8 *, 0x33);
            if (*(arg0 + 0x34 + ((temp_r3_2 >> 5) * 4)) & (1 << (temp_r3_2 & 0x1F))) {
                var_r6 |= 0x400;
            }
            AP_Update(M2C_FIELD(arg0, s32 *, 0x38), 0x1FF & M2C_FIELD(&sp4, u16 *, 0), var_r6);
        }
    }
}
