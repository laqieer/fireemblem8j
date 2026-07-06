M2C_UNK BG_EnableSyncByMask(s32);                   /* extern */
M2C_UNK Decompress(s32, s32);                       /* extern */
M2C_UNK EndCgText();                                /* extern */
M2C_UNK EndFaceById(s32);                           /* extern */
M2C_UNK GetSavedRankData(M2C_UNK *, u8, u8);        /* extern */
M2C_UNK InitTalk(s32, s32, s32);                    /* extern */
M2C_UNK SetCgTextFlags(s32);                        /* extern */
M2C_UNK StartCgText(s32, s32, s32, s32, s32, s32, s32, s32); /* extern */
M2C_UNK StartFace2(s32, u16, s32, s32, s32);        /* extern */
M2C_UNK j_TmApplyTsa(s32, s32, s32);                /* extern */
M2C_UNK strcpy(s8 *, M2C_UNK *);                    /* extern */
M2C_UNK sub_80A33E0(void *);                        /* extern */
M2C_UNK sub_80A3528(void *);                        /* extern */
u8 sub_80A40A0(u8, u8);                             /* extern */

void Augury_InitResultScreen(void *arg0) {
    M2C_UNK sp10;
    M2C_UNK sp1C;
    s16 sp28;
    s32 var_r2;
    s8 *temp_r4;
    u32 temp_r0;
    u8 *temp_r1;
    u8 *var_r4;
    u8 temp_r0_2;
    u8 temp_r0_3;
    u8 temp_r0_4;
    u8 temp_r0_5;
    u8 temp_r1_2;
    u8 temp_r1_3;
    u8 temp_r2;
    u8 temp_r4_2;
    void *temp_r1_4;

    sp28 = 0;
    CpuSet(&sp28, &sp10, 0x0100000CU);
    GetSavedRankData(&sp10, M2C_FIELD(arg0, u8 *, 0x3C), M2C_FIELD((arg0 + 0x3C), u8 *, 1));
    temp_r2 = M2C_FIELD(&sp10, u8 *, 0);
    temp_r0 = (u32) (temp_r2 << 0x1F) >> 0x1F;
    M2C_FIELD(arg0, s8 *, 0x3B) = (s8) temp_r0;
    if (temp_r0 == 0) {
        var_r2 = 0;
        var_r4 = arg0 + 0x3B;
        do {
            temp_r1 = arg0 + 0x34 + var_r2;
            *temp_r1 |= 0xFF;
            var_r2 += 1;
        } while (var_r2 <= 4);
    } else {
        M2C_FIELD(arg0, u8 *, 0x34) = (u8) ((u32) (temp_r2 << 0x19) >> 0x1D);
        M2C_FIELD(arg0, u8 *, 0x35) = (u8) ((u32) ((u16) M2C_FIELD(&sp10, u8 *, 0) << 0x16) >> 0x1D);
        temp_r1_2 = M2C_FIELD(&sp10, u8 *, 1);
        M2C_FIELD(arg0, u8 *, 0x36) = (u8) ((u32) (temp_r1_2 << 0x1B) >> 0x1D);
        M2C_FIELD(arg0, u8 *, 0x37) = (u8) ((u32) (temp_r1_2 << 0x18) >> 0x1D);
        temp_r1_3 = M2C_FIELD(&sp10, u8 *, 2);
        M2C_FIELD(arg0, u8 *, 0x38) = (u8) ((u32) (temp_r1_3 << 0x1D) >> 0x1D);
        M2C_FIELD(arg0, u8 *, 0x3E) = (u8) ((u32) (temp_r1_3 << 0x19) >> 0x1F);
        temp_r1_4 = arg0 + 0x40;
        M2C_FIELD(arg0, s8 *, 0x40) = (s8) (sp14 >> 7);
        M2C_FIELD(temp_r1_4, s8 *, 1) = (s8) ((u32) (M2C_FIELD(&sp10, u8 *, 6) << 0x19) >> 0x1A);
        M2C_FIELD((temp_r1_4 + 1), s8 *, 1) = (s8) ((u32) ((u16) M2C_FIELD(&sp10, u8 *, 6) << 0x13) >> 0x1A);
        M2C_FIELD(arg0, s32 *, 0x58) = (s32) (((sp18 & 0x1FFFFF) * 8) | ((u8) M2C_FIELD(&sp10, u8 *, 7) >> 5));
        M2C_FIELD(arg0, u8 *, 0x3F) = (u8) M2C_FIELD(&sp10, u8 *, 0x17);
        M2C_FIELD(arg0, u8 *, 0x39) = (u8) GetOverallRank((s32) M2C_FIELD(arg0, u8 *, 0x34), (s32) M2C_FIELD(arg0, u8 *, 0x35), (s32) M2C_FIELD(arg0, u8 *, 0x36), (s32) M2C_FIELD(arg0, u8 *, 0x37), (s32) M2C_FIELD(arg0, u8 *, 0x38));
        M2C_FIELD(arg0, s8 *, 0x4E) = (s8) ((u32) (M2C_FIELD(&sp10, u16 *, 0xA) << 0x15) >> 0x1A);
        *((arg0 + 0x4E) - 0x14) = (s8) ((u16) M2C_FIELD(&sp10, u8 *, 2) >> 7);
        if (M2C_FIELD(arg0, u8 *, 0x3E) != 0) {
            temp_r4 = arg0 + 0x43;
            strcpy(temp_r4, &sp1C);
            SetTacticianName(temp_r4);
        } else {
            SetTacticianName(GetStringFromIndex(0x1F1));
        }
        temp_r0_2 = M2C_FIELD(arg0, u8 *, 0x3F);
        if (temp_r0_2 != 0) {
            temp_r0_3 = sub_80A40A0(temp_r0_2, M2C_FIELD(arg0, u8 *, 0x39));
            if (temp_r0_3 == 0) {
                M2C_FIELD(arg0, u8 *, 0x3F) = temp_r0_3;
            }
            var_r4 = arg0 + 0x3B;
            if (M2C_FIELD(arg0, u8 *, 0x3F) == 0) {
                goto block_9;
            }
        } else {
block_9:
            temp_r0_4 = M2C_FIELD(arg0, u8 *, 0x3C);
            if (temp_r0_4 == 0) {
                M2C_FIELD(arg0, u8 *, 0x3F) = temp_r0_4;
                var_r4 = arg0 + 0x3B;
            } else {
                M2C_FIELD(arg0, u8 *, 0x3F) = 0U;
                var_r4 = arg0 + 0x3B;
            }
        }
    }
    Decompress(0x08A9A8D4, 0x02020188);
    j_TmApplyTsa(0x020234A8, 0x02020188, 0x5280);
    sub_80A3528(arg0);
    sub_80A33E0(arg0);
    BG_EnableSyncByMask(7);
    EndFaceById(0);
    EndCgText();
    if (*var_r4 != 0) {
        temp_r0_5 = M2C_FIELD(arg0, u8 *, 0x3F);
        if (temp_r0_5 != 0) {
            StartFace2(0, M2C_FIELD(((0x34 * (temp_r0_5 - 1)) + 0x088582BC), u16 *, 6), 0xD8, 0x58, 0x182);
            temp_r4_2 = sub_80A40A0(M2C_FIELD(arg0, u8 *, 0x3F), M2C_FIELD(arg0, u8 *, 0x39));
            InitTalk(0x28, 0, 1);
            StartCgText(0x16, 0x13, 0x12, 4, (s32) temp_r4_2, 0x06011000, 0xA, 0);
            SetCgTextFlags(0x809FE);
        }
    }
}
