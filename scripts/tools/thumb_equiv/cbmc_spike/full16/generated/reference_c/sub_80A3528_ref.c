M2C_UNK BG_EnableSyncByMask(s32);                   /* extern */
M2C_UNK BG_Fill(s32, s32);                          /* extern */
M2C_UNK PutDrawText(s32, s32, s32, s32, s32, s8 *); /* extern */
M2C_UNK PutNumber(s32, s32, s32);                   /* extern */
M2C_UNK PutNumber2Digit(s32, s32, u8);              /* extern */
M2C_UNK PutSpecialChar(s32, s32, s32);              /* extern */
M2C_UNK ResetText();                                /* extern */
M2C_UNK SetTextFont(s32);                           /* extern */
M2C_UNK SetTextFontGlyphs(s32);                     /* extern */
M2C_UNK sub_80A34F0(s32, s32, s32, s32, s32);       /* extern */

void sub_80A3528(void *arg0) {
    u8 *sp8;
    u8 *spC;
    u8 *sp10;
    u8 *sp14;
    s32 temp_r3;
    s32 var_r4;
    s32 var_r5;
    s32 var_r6;
    s32 var_r7;
    s32 var_r7_2;
    s32 var_r8;
    u8 *temp_r1;

    ResetText();
    BG_Fill(0x02023CA8, 0);
    SetTextFontGlyphs(0);
    SetTextFont(0);
    PutDrawText(0, 0x02023CEC, 0, 0, 0xC, M2C_FIELD((M2C_FIELD(arg0, u8 *, 0x3C) * 4), s8 **, 0x08A9553C));
    if (M2C_FIELD(arg0, u8 *, 0x3B) == 0) {
        var_r7 = 0;
        var_r5 = 0x100;
        var_r4 = 4;
        do {
            PutDrawText(0, var_r5 + 0x02023CAC, 1, 0, 5, GetStringFromIndex(M2C_FIELD((var_r7 * 4), s32 *, 0x08A95438)));
            sub_80A34F0(8, var_r4, 1, 0x14, 3);
            var_r5 += 0x80;
            var_r4 += 2;
            var_r7 += 1;
        } while (var_r7 <= 4);
        PutDrawText(0, 0x02023DC8, 1, 0, 4, GetStringFromIndex(0x4D0));
        sub_80A34F0(0x15, 7, 1, 0x14, 3);
        PutDrawText(0, 0x02023E48, 1, 0, 4, GetStringFromIndex(0x4D1));
        sub_80A34F0(0x15, 9, 1, 0x14, 3);
        PutDrawText(0, 0x02023CFA, 1, 0, 5, GetStringFromIndex(0x4D2));
        sub_80A34F0(0xD, 1, 1, 0x14, 1);
        if (M2C_FIELD(arg0, u8 *, 0x3D) == 0) {
            PutDrawText(0, 0x02023D08, 1, 0, 4, GetStringFromIndex(0x4D3));
        } else {
            PutDrawText(0, 0x02023D08, 1, 4, 4, GetStringFromIndex(0x4D4));
        }
        sub_80A34F0(0x17, 1, 1, 0x14, 4);
    } else {
        temp_r1 = arg0 + 0x41;
        spC = temp_r1;
        sp10 = arg0 + 0x42;
        sp8 = arg0 + 0x39;
        sp14 = temp_r1 + 0xD;
        var_r6 = 0x100;
        var_r8 = 0x08A95438;
        var_r7_2 = 4;
        do {
            temp_r3 = var_r8 + 4;
            var_r8 = temp_r3;
            PutDrawText(0, var_r6 + 0x02023CAC, 0, 0, 5, GetStringFromIndex(*(temp_r3 - 4)));
            var_r6 += 0x80;
            var_r7_2 -= 1;
        } while (var_r7_2 >= 0);
        PutDrawText(0, 0x02023DC8, 0, 0, 4, GetStringFromIndex(0x4D0));
        PutNumber(0x02023DDC, 2, M2C_FIELD(arg0, s32 *, 0x58));
        PutSpecialChar(0x02023DDE, 3, 0x1E);
        PutDrawText(0, 0x02023E48, 0, 0, 4, GetStringFromIndex(0x4D1));
        PutSpecialChar(0x02023E54, 0, 0x20);
        PutSpecialChar(0x02023E5A, 0, 0x20);
        PutNumber(0x02023E52, 2, (s32) M2C_FIELD(arg0, u8 *, 0x40));
        PutNumber2Digit(0x02023E58, 2, *spC);
        PutNumber2Digit(0x02023E5E, 2, *sp10);
        PutDrawText(0, 0x02023CFA, 3, 0, 5, GetStringFromIndex(0x4D2));
        PutSpecialChar(0x02023D02, 4, M2C_FIELD((*sp8 * 4), s32 *, 0x08A95524));
        if (M2C_FIELD(arg0, u8 *, 0x3D) == 0) {
            PutDrawText(0, 0x02023D08, 3, 0, 4, GetStringFromIndex(0x4D3));
        } else {
            PutDrawText(0, 0x02023D08, 3, 4, 4, GetStringFromIndex(0x4D4));
        }
        PutDrawText(0, 0x02023D16, 3, 0, 2, GetStringFromIndex(0x4D5));
        PutNumber(0x02023D1A, 2, (s32) *sp14);
        PutDrawText(0, 0x02023D1C, 3, 0, 2, GetStringFromIndex(0x4D6));
    }
    BG_EnableSyncByMask(4);
}
