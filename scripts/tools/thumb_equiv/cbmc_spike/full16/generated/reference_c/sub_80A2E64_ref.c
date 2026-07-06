M2C_UNK PutSpriteExt(s32, s32, s32, s32, s32);      /* extern */
M2C_UNK SetObjAffine(s32, s16, s16, s16, s32);      /* extern */
M2C_UNK sub_80A2E4C(s32);                           /* extern */

void DivinationRankSpriteUpdate(void *arg0) {
    s32 sp4;
    s32 sp8;
    s16 temp_r4;
    s16 temp_r4_2;
    s16 temp_r5;
    s16 temp_r5_2;
    s16 temp_r6;
    s16 temp_r6_2;
    s32 temp_r0;
    s32 temp_r1;
    s32 temp_r2;
    s32 temp_r3;
    s32 var_r4;
    s32 var_r4_2;
    s32 var_r5;
    s32 var_r8;
    s32 var_r8_2;
    s32 var_sl;
    u8 *var_r6;

    temp_r1 = M2C_FIELD(arg0, s32 *, 0x2C);
    if ((s32) (temp_r1 >> 3) <= 5) {
        temp_r0 = temp_r1 + 2;
        M2C_FIELD(arg0, s32 *, 0x2C) = temp_r0;
        if ((temp_r0 >> 3) == 6) {
            sub_80A2E4C(0xF);
        }
    }
    var_r6 = arg0 + 0x34;
    sp8 = 0x11;
    var_r8 = 4;
    do {
        if (*var_r6 != 0xFF) {
            var_r5 = 0;
            if (((s32) *var_r6 >= 0) && ((s32) ((s32) M2C_FIELD(arg0, s32 *, 0x2C) >> 3) > 0)) {
                var_r4 = 0x50;
                var_sl = 0x08A95478;
loop_8:
                temp_r3 = var_sl + 4;
                var_sl = temp_r3;
                PutSpriteExt(4, var_r4 + (var_r5 << 9), sp8 + 0x100, *(temp_r3 - 4), 0xF380);
                var_r4 += 0xF;
                var_r5 += 1;
                if (var_r5 <= (s32) *var_r6) {
                    if (var_r5 < (s32) ((s32) M2C_FIELD(arg0, s32 *, 0x2C) >> 3)) {
                        goto loop_8;
                    }
                }
            }
        }
        var_r6 += 1;
        sp8 += 0x10;
        var_r8 -= 1;
    } while (var_r8 >= 0);
    var_r8_2 = 0;
    do {
        temp_r2 = var_r8_2 + 1;
        var_r4_2 = (M2C_FIELD(arg0, s32 *, 0x2C) - (temp_r2 * 8)) << 5;
        sp4 = temp_r2;
        if (var_r4_2 > 0x100) {
            var_r4_2 = 0x100;
        }
        if (var_r4_2 > 0x20) {
            temp_r6 = (s16) Div(*(s16 *)0x080DC1DC * 0x10, var_r4_2);
            temp_r5 = (s16) Div((0 - *(s16 *)0x080DC15C) * 0x10, 0x100);
            temp_r4 = (s16) Div(*(s16 *)0x080DC15C * 0x10, var_r4_2);
            SetObjAffine(var_r8_2, temp_r6, temp_r5, temp_r4, (s32) (s16) Div(*(void *)0x080DC1DC * 0x10, 0x100));
        } else {
            temp_r6_2 = (s16) Div(*(void *)0x080DC1DC * 0x10, 0x20);
            temp_r5_2 = (s16) Div((0 - *(s16 *)0x080DC15C) * 0x10, 0x100);
            temp_r4_2 = (s16) Div(*(s16 *)0x080DC15C * 0x10, 0x20);
            SetObjAffine(var_r8_2, temp_r6_2, temp_r5_2, temp_r4_2, (s32) (s16) Div(*(void *)0x080DC1DC * 0x10, 0x100));
        }
        var_r8_2 = sp4;
    } while (sp4 <= 4);
}
