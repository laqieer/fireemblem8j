M2C_UNK AiGetUnitClosestValidPosition(s32, s8, s8, void *); /* extern */
M2C_UNK GenerateExtendedMovementMapOnRange(s16, s16, s32); /* extern */
s32 GetUnitMovementCost(s32);                       /* extern */
s32 NextRN_N(u8);                                   /* extern */

void AdjustNewUnitPosition(s32 arg0, void *arg1, u16 arg2) {
    s16 temp_r4;
    s16 temp_r5;
    s32 temp_r3;
    s8 temp_r1;
    s8 temp_r2_2;
    s8 temp_r4_2;
    s8 temp_r5_2;
    s8 var_r2;
    s8 var_r4;
    u16 temp_r2;
    u8 var_r7;
    void *temp_r0;
    void *temp_r1_2;

    temp_r2 = arg2;
    if (2 & temp_r2) {
        var_r7 = 0;
        temp_r4 = M2C_FIELD(arg1, s16 *, 0);
        temp_r5 = M2C_FIELD(arg1, s16 *, 2);
        GenerateExtendedMovementMapOnRange(temp_r4, temp_r5, GetUnitMovementCost(arg0));
        var_r2 = -1;
        do {
            var_r4 = -1;
            temp_r5_2 = var_r2 + (u8) M2C_FIELD(arg1, s16 *, 2);
loop_3:
            temp_r1 = var_r4 + (u8) M2C_FIELD(arg1, s16 *, 0);
            if ((var_r4 != 0) || (var_r2 != 0)) {
                temp_r3 = temp_r5_2 * 4;
                if ((*(*(temp_r3 + *(s32 *)0x0202E4D4) + temp_r1) == 0) && (*(*(temp_r3 + *(s32 *)0x0202E4EC) + temp_r1) == 0) && (*(*(temp_r3 + *(s32 *)0x0202E4E8) + temp_r1) == 0) && ((s32) (s8) *(*(temp_r3 + *(s32 *)0x0202E4E0) + temp_r1) >= 0)) {
                    temp_r0 = (var_r7 * 4) + sp;
                    M2C_FIELD(temp_r0, s16 *, 0) = (s16) temp_r1;
                    M2C_FIELD(temp_r0, s16 *, 2) = (s16) temp_r5_2;
                    var_r7 += 1;
                }
            }
            var_r4 += 1;
            if ((s32) var_r4 <= 1) {
                goto loop_3;
            }
            var_r2 += 1;
        } while ((s32) var_r2 <= 1);
        if (var_r7 != 0) {
            temp_r1_2 = &subroutine_arg0 + ((u32) (NextRN_N(var_r7) << 0x18) >> 0x16);
            M2C_FIELD(arg1, s16 *, 0) = (s16) M2C_FIELD(temp_r1_2, u16 *, 0);
            M2C_FIELD(arg1, s16 *, 2) = (s16) M2C_FIELD(temp_r1_2, u16 *, 2);
        }
    } else if (1 & temp_r2) {
        temp_r4_2 = (s8) M2C_FIELD(arg1, s16 *, 0);
        temp_r2_2 = (s8) M2C_FIELD(arg1, s16 *, 2);
        if (*(*((temp_r2_2 * 4) + *(s32 *)0x0202E4D8) + temp_r4_2) != 0) {
            AiGetUnitClosestValidPosition(arg0, temp_r4_2, temp_r2_2, arg1);
        }
    }
}
