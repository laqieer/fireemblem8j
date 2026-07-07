s32 CheckBanimHensei();                             /* extern */
s8 CheckBattleScripted();                           /* extern */
s32 FilterBattleAnimCharacterPalette(s16, u16);     /* extern */
s16 GetBanimBackgroundIndex(u16, u8);               /* extern */
s16 GetBanimFactionPalette(s32);                    /* extern */
s32 GetBanimLinkArenaFlag();                        /* extern */
u16 GetBanimTerrainGround(u8, u8);                  /* extern */
s32 GetBattleAnimArenaFlag();                       /* extern */
s32 GetBattleAnimPreconfType();                     /* extern */
s16 GetBattleAnimationId(void *, s32, u16, M2C_UNK *); /* extern */
s32 GetItemAttributes(u16);                         /* extern */
u16 GetItemIndex(u16);                              /* extern */
void *GetROMChapterStruct(s8);                      /* extern */
s16 GetSpellAnimId(u8, u16);                        /* extern */
u8 GetSpellAssocCharCount(u16);                     /* extern */
s32 IsItemDisplayedInBattle(u16);                   /* extern */
s8 IsItemEffectiveAgainst(u16, void *);             /* extern */
s8 IsUnitEffectiveAgainst(void *, void *);          /* extern */
M2C_UNK ParseBattleHitToBanimCmd();                 /* extern */
M2C_UNK ResetEkrDragonStatus();                     /* extern */
M2C_UNK SetBanimArenaFlag(s32);                     /* extern */
M2C_UNK SetBanimLinkArenaFlag(s32);                 /* extern */
M2C_UNK SetBattleUnscripted();                      /* extern */
M2C_UNK SetEkrDragonStatusType(s32, s32);           /* extern */
M2C_UNK UnsetMapStaffAnim(s32, s32, u16);           /* extern */

s32 PrepareBattleGraphicsMaybe(void) {
    M2C_UNK sp4;
    void *sp8;
    void *spC;
    void *sp10;
    void *sp14;
    void *sp18;
    s32 sp1C;
    u16 *sp20;
    u16 *sp24;
    u8 *sp28;
    s16 *var_r8;
    s16 temp_r0_10;
    s16 temp_r0_11;
    s16 temp_r0_2;
    s16 temp_r0_3;
    s16 temp_r0_4;
    s16 temp_r0_5;
    s16 temp_r0_6;
    s16 temp_r0_8;
    s16 temp_r1;
    s16 temp_r1_2;
    s16 temp_r1_3;
    s16 temp_r5;
    s16 temp_r7;
    s16 temp_r7_2;
    s16 var_r0_4;
    s16 var_r4_2;
    s32 temp_r0;
    s32 var_r4_4;
    s32 var_r5;
    u16 temp_r2;
    u16 temp_r4_3;
    u16 var_r0;
    u16 var_r0_2;
    u16 var_r0_3;
    u16 var_r1;
    u16 var_r1_2;
    u16 var_r1_3;
    u16 var_r1_4;
    u16 var_r4_3;
    u8 temp_r0_7;
    u8 temp_r0_9;
    u8 temp_r4;
    u8 temp_r4_2;
    u8 var_r6;
    void *temp_r2_2;
    void *temp_r2_3;
    void *var_r4;

    ResetEkrDragonStatus();
    if (!(0x20 & *(u16 *)((unsigned long)&gBattleStats))) {
        SetBanimArenaFlag(0);
    } else {
        SetBanimArenaFlag(1);
    }
    if (!(0x40 & M2C_FIELD((void *)((unsigned long)&gBmSt), u8 *, 4))) {
        SetBanimLinkArenaFlag(0);
    } else {
        SetBanimLinkArenaFlag(1);
    }
    temp_r2 = 0x10 & *(u32 *)((unsigned long)&gBattleStats);
    if (temp_r2 != 0) {
        *(u16 *)((unsigned long)&gEkrDistanceType) = 4;
        var_r8 = (s16 *)((unsigned long)&gEkrDistanceType);
    } else {
        *(s16 *)((unsigned long)&gEkrDistanceType) = temp_r2;
        var_r8 = (s16 *)((unsigned long)&gEkrDistanceType);
    }
    if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) == 4) {
        *(s32 *)((unsigned long)&gpEkrBattleUnitLeft) = ((unsigned long)&gBattleActor);
        sp8 = (void *)((unsigned long)&gBattleActor);
        *(s32 *)((unsigned long)&gpEkrBattleUnitRight) = ((unsigned long)&gBattleTarget);
        spC = (void *)((unsigned long)&gBattleTarget);
        M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 2) = 0;
        M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 0) = 0;
        M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0) = 1;
        M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 2) = 1;
        var_r4 = sp8;
    } else {
        temp_r5 = GetBanimFactionPalette(-0x40 & M2C_FIELD((void *)((unsigned long)&gBattleActor), u8 *, 0xB));
        temp_r7 = GetBanimFactionPalette(-0x40 & M2C_FIELD((void *)((unsigned long)&gBattleTarget), u8 *, 0xB));
        if ((0x40 & *(u32 *)((unsigned long)&gBattleStats)) || (M2C_FIELD((void *)((unsigned long)&gBattleActor), u16 *, 0x4A) == 0)) {
            var_r6 = 2;
        } else {
            var_r6 = GetSpellAssocCharCount(GetItemIndex(M2C_FIELD((void *)((unsigned long)&gBattleActor), u16 *, 0x4A)));
        }
        M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 2) = 1;
        M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0) = 1;
        var_r4_2 = 0;
        if ((GetBanimLinkArenaFlag() != 1) && ((temp_r5 == 0) || (temp_r5 == 2) || ((temp_r5 == 1) && (temp_r7 == 1)))) {
            var_r4_2 = 1;
        }
        if (var_r4_2 == 1) {
            *(u32 *)((unsigned long)&gpEkrBattleUnitLeft) = ((unsigned long)&gBattleTarget);
            sp8 = (void *)((unsigned long)&gBattleTarget);
            *(u32 *)((unsigned long)&gpEkrBattleUnitRight) = ((unsigned long)&gBattleActor);
            spC = (void *)((unsigned long)&gBattleActor);
            M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 0) = var_r4_2;
            M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 2) = 0;
            var_r8 = (s16 *)((unsigned long)&gEkrDistanceType);
            var_r4 = spC;
            if (var_r6 == 1) {
                M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0) = 0;
            }
        } else {
            *(u32 *)((unsigned long)&gpEkrBattleUnitLeft) = ((unsigned long)&gBattleActor);
            sp8 = (void *)((unsigned long)&gBattleActor);
            *(u32 *)((unsigned long)&gpEkrBattleUnitRight) = ((unsigned long)&gBattleTarget);
            spC = (void *)((unsigned long)&gBattleTarget);
            M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 0) = 0;
            M2C_FIELD((void *)((unsigned long)gBanimPositionIsEnemy), s16 *, 2) = 1;
            var_r8 = (s16 *)((unsigned long)&gEkrDistanceType);
            var_r4 = sp8;
            if (var_r6 == 1) {
                M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 2) = 0;
            }
        }
    }
    sp18 = spC;
    sp10 = M2C_FIELD(sp8, void **, 0);
    sp14 = M2C_FIELD(spC, void **, 0);
    sp1C = 0;
    var_r5 = 0;
    temp_r7_2 = M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0);
    temp_r1 = M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 2);
    if (temp_r7_2 != 0) {
        var_r5 = M2C_FIELD(M2C_FIELD(sp8, void **, 4), s32 *, 0x34);
    }
    if (temp_r1 != 0) {
        sp1C = M2C_FIELD(M2C_FIELD(sp18, void **, 4), s32 *, 0x34);
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 0) = (s16) ((s32) ((M2C_FIELD(sp8, s8 *, 0x10) * 0x10) - *(s16 *)((unsigned long)&gBmSt + 0x0C)) >> 4);
        M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 2) = (s16) ((s32) ((M2C_FIELD(sp8, s8 *, 0x11) * 0x10) - *(s16 *)((unsigned long)&gBmSt + 0x0E)) >> 4);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 4) = (s16) ((s32) ((M2C_FIELD(sp18, s8 *, 0x10) * 0x10) - *(u32 *)((unsigned long)&gBmSt + 0x0C)) >> 4);
        M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 6) = (s16) ((s32) ((M2C_FIELD(sp18, s8 *, 0x11) * 0x10) - *(u32 *)((unsigned long)&gBmSt + 0x0E)) >> 4);
    }
    if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) != 4) {
        if (0x80 & GetItemAttributes(M2C_FIELD(var_r4, u16 *, 0x4A))) {
            *(s16 *)((unsigned long)&gEkrDistanceType) = 2;
        } else {
            *(s16 *)((unsigned long)&gEkrDistanceType) = 3;
            if ((temp_r7_2 + temp_r1) == 2) {
                if ((s32) (M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 0) - M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 4)) >= 0) {
                    var_r0 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 0);
                    var_r1 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 4);
                } else {
                    var_r0 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 4);
                    var_r1 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 0);
                }
                if ((s32) (M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 2) - M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 6)) >= 0) {
                    var_r0_2 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 2);
                    var_r1_2 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 6);
                } else {
                    var_r0_2 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 6);
                    var_r1_2 = (u16) M2C_FIELD((void *)((unsigned long)gEkrBmLocation), s16 *, 2);
                }
                temp_r0 = (s16) (var_r0 - var_r1) + (s16) (var_r0_2 - var_r1_2);
                if (temp_r0 <= 1) {
                    var_r0_3 = 0;
                } else if (temp_r0 <= 3) {
                    var_r0_3 = 1;
                } else {
                    var_r0_3 = 2;
                }
                *(s16 *)((unsigned long)&gEkrDistanceType) = var_r0_3;
                var_r8 = (s16 *)((unsigned long)&gEkrDistanceType);
            }
        }
        if (*var_r8 == 4) {
            goto block_51;
        }
        if (temp_r7_2 != 0) {
            temp_r0_2 = GetBattleAnimationId(sp8, var_r5, M2C_FIELD(sp8, u16 *, 0x4A), &subroutine_arg0);
            M2C_FIELD((void *)((unsigned long)gBanimIdx), s16 *, 0) = temp_r0_2;
            M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 0) = temp_r0_2;
        }
        sp20 = sp8 + 0x48;
        sp24 = spC + 0x48;
        if (temp_r1 != 0) {
            temp_r0_3 = GetBattleAnimationId(sp18, sp1C, M2C_FIELD(spC, u16 *, 0x4A), &sp4);
            M2C_FIELD((void *)((unsigned long)gBanimIdx), s16 *, 2) = temp_r0_3;
            M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 2) = temp_r0_3;
        }
    } else {
block_51:
        temp_r0_4 = GetBattleAnimationId(sp8, var_r5, M2C_FIELD(sp8, u16 *, 0x48), &subroutine_arg0);
        M2C_FIELD((void *)((unsigned long)gBanimIdx), s16 *, 0) = temp_r0_4;
        M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 0) = temp_r0_4;
        temp_r0_5 = GetBattleAnimationId(sp18, sp1C, M2C_FIELD(spC, u16 *, 0x48), &sp4);
        M2C_FIELD((void *)((unsigned long)gBanimIdx), s16 *, 2) = temp_r0_5;
        M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 2) = temp_r0_5;
        sp20 = sp8 + 0x48;
        sp24 = spC + 0x48;
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePal), s16 *, 0) = 0xFFFF;
    }
    var_r1_3 = 0;
    sp28 = spC + 0x55;
loop_61:
    temp_r2_2 = var_r1_3 + ((u16) (M2C_FIELD(M2C_FIELD(sp8, void **, 0), u8 *, 4) - 1) * 7);
    if ((gAnimCharaPalConfig[((unsigned long)temp_r2_2) / 7][((unsigned long)temp_r2_2) % 7] != M2C_FIELD(M2C_FIELD(sp8, void **, 4), u8 *, 4)) || (temp_r7_2 == 0)) {
        var_r1_3 += 1;
        if ((u32) var_r1_3 <= 6U) {
            goto loop_61;
        }
    } else {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePal), s16 *, 0) = (s16) (gAnimCharaPalIt[((unsigned long)temp_r2_2) / 7][((unsigned long)temp_r2_2) % 7] - 1);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePal), s16 *, 2) = 0xFFFF;
    }
    var_r1_4 = 0;
loop_67:
    temp_r2_3 = var_r1_4 + ((u16) (M2C_FIELD(M2C_FIELD(sp18, void **, 0), u8 *, 4) - 1) * 7);
    if ((gAnimCharaPalConfig[((unsigned long)temp_r2_3) / 7][((unsigned long)temp_r2_3) % 7] != M2C_FIELD(M2C_FIELD(sp18, void **, 4), u8 *, 4)) || (temp_r1 == 0)) {
        var_r1_4 += 1;
        if ((u32) var_r1_4 <= 6U) {
            goto loop_67;
        }
    } else {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePal), s16 *, 2) = (s16) (gAnimCharaPalIt[((unsigned long)temp_r2_3) / 7][((unsigned long)temp_r2_3) % 7] - 1);
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimTriAtkPalettes), s32 *, 0) = FilterBattleAnimCharacterPalette(M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 0), M2C_FIELD(sp8, u16 *, 0x4A));
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimTriAtkPalettes), s32 *, 4) = FilterBattleAnimCharacterPalette(*(s16 *)((unsigned long)&gBanimIdx_bak[1]), M2C_FIELD(spC, u16 *, 0x4A));
    }
    M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 0) = (u16) M2C_FIELD(sp8, u8 *, 0x55);
    M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 2) = (u16) *sp28;
    M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 2) = 0xFFFFU;
    M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) = -1U;
    if (temp_r7_2 != 0) {
        temp_r4 = M2C_FIELD(sp8, u8 *, 0x55);
        M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) = GetBanimTerrainGround(temp_r4, M2C_FIELD(GetROMChapterStruct((s8) M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0xE)), u8 *, 0x13));
    }
    if (temp_r1 != 0) {
        temp_r4_2 = *sp28;
        M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 2) = GetBanimTerrainGround(temp_r4_2, M2C_FIELD(GetROMChapterStruct((s8) M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0xE)), u8 *, 0x13));
    }
    if (0x40 & M2C_FIELD((void *)((unsigned long)&gBmSt), u8 *, 4)) {
        M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 0) = 0x30U;
        M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 2) = 0x30U;
        if (temp_r7_2 != 0) {
            M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) = GetBanimTerrainGround(0x30U, M2C_FIELD(GetROMChapterStruct((s8) M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0xE)), u8 *, 0x13));
        }
        if (temp_r1 != 0) {
            temp_r4_3 = M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 2);
            M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 2) = GetBanimTerrainGround((u8) temp_r4_3, M2C_FIELD(GetROMChapterStruct((s8) M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0xE)), u8 *, 0x13));
        }
    }
    if (CheckBanimHensei() == 1) {
        M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 2) = 0x14U;
        M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) = 0x14U;
        M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 2) = 0x30U;
        M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 0) = 0x30U;
    }
    temp_r0_6 = (s16) *(s16 *)((unsigned long)&gEkrDistanceType);
    if (((s32) temp_r0_6 >= 0) && ((s32) temp_r0_6 > 3) && (temp_r0_6 == 4)) {
        M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) = (u16) M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 2);
    }
    temp_r0_7 = M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0x15);
    if (((s32) temp_r0_7 <= 2) && ((s32) temp_r0_7 >= 1)) {
        var_r0_4 = 1;
    } else {
        var_r0_4 = 0;
    }
    *(s16 *)((unsigned long)&gEkrSnowWeather) = var_r0_4;
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimCon), s16 *, 0) = (s16) (s8) M2C_FIELD(M2C_FIELD(sp8, void **, 4), u8 *, 0x11);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimCon), s16 *, 2) = (s16) (s8) M2C_FIELD(M2C_FIELD(sp18, void **, 4), u8 *, 0x11);
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHp), s16 *, 0) = (s16) (s8) M2C_FIELD(sp8, u8 *, 0x72);
        M2C_FIELD((void *)((unsigned long)gBanimMaxHP), s16 *, 0) = (s16) M2C_FIELD(sp8, s8 *, 0x12);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHp), s16 *, 2) = (s16) (s8) M2C_FIELD(spC, u8 *, 0x72);
        M2C_FIELD((void *)((unsigned long)gBanimMaxHP), s16 *, 2) = (s16) M2C_FIELD(sp18, s8 *, 0x12);
    }
    ParseBattleHitToBanimCmd();
    if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) == 4) {
        M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 2) = 1;
        M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 0) = 1;
    } else {
        if (temp_r7_2 != 0) {
            M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 0) = GetSpellAnimId(M2C_FIELD(M2C_FIELD(sp8, void **, 4), u8 *, 4), M2C_FIELD(sp8, u16 *, 0x4A));
        }
        if (temp_r1 != 0) {
            M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 2) = GetSpellAnimId(M2C_FIELD(M2C_FIELD(sp18, void **, 4), u8 *, 4), M2C_FIELD(spC, u16 *, 0x4A));
        }
        if ((0x40 & *(u32 *)((unsigned long)&gBattleStats)) && (IsItemDisplayedInBattle(M2C_FIELD(spC, u16 *, 0x4A)) == 0) && (M2C_FIELD(M2C_FIELD(sp18, void **, 4), u8 *, 4) == 0x4D)) {
            M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 2) = 0xF;
        }
    }
    if (temp_r7_2 != 0) {
        UnsetMapStaffAnim(((unsigned long)gEkrSpellAnimIndex), 0, M2C_FIELD(sp8, u16 *, 0x4A));
    }
    if (temp_r1 != 0) {
        UnsetMapStaffAnim(((unsigned long)&gEkrSpellAnimIndex[1]), 1, M2C_FIELD(spC, u16 *, 0x4A));
    }
    temp_r0_8 = (s16) *(s16 *)((unsigned long)&gEkrDistanceType);
    if (((s32) temp_r0_8 >= 0) && ((s32) temp_r0_8 <= 2)) {
        temp_r0_9 = M2C_FIELD(M2C_FIELD(sp8, void **, 4), u8 *, 4);
        switch (temp_r0_9) {                        /* irregular */
        case 0x65:
            SetEkrDragonStatusType(*(u32 *)((unsigned long)gAnims), 1);
            break;
        case 0x66:
            SetEkrDragonStatusType(*(s32 *)((unsigned long)gAnims), 2);
            break;
        }
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimFactionPal), s16 *, 0) = GetBanimFactionPalette(-0x40 & M2C_FIELD(sp8, u8 *, 0xB));
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimFactionPal), s16 *, 2) = GetBanimFactionPalette(-0x40 & M2C_FIELD(sp18, u8 *, 0xB));
    }
    M2C_FIELD((void *)((unsigned long)gEkrPids), u8 *, 1) = 0U;
    M2C_FIELD((void *)((unsigned long)gEkrPids), u8 *, 0) = 0U;
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrPids), u8 *, 0) = (u8) M2C_FIELD(sp10, u8 *, 4);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrPids), u8 *, 1) = (u8) M2C_FIELD(sp14, u8 *, 4);
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 0) = (u16) M2C_FIELD(sp8, u16 *, 0x64);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 2) = (u16) M2C_FIELD(spC, u16 *, 0x64);
    }
    if ((s16) M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 0) == 0xFF) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 0) = 0xFFFFU;
    }
    if ((s16) M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 2) == 0xFF) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 2) = 0xFFFFU;
    }
    if (temp_r7_2 != 0) {
        temp_r1_2 = M2C_FIELD(sp8, u16 *, 0x5A) - M2C_FIELD(spC, u16 *, 0x5C);
        M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 0) = temp_r1_2;
        if (temp_r1_2 < 0) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 0) = 0;
        }
        if ((s16) M2C_FIELD(sp8, u16 *, 0x5A) == 0xFF) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 0) = 0xFFFF;
        }
        if (GetItemIndex(*sp20) == 0xB5) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 0) = 0xFFFF;
        }
    }
    if (temp_r1 != 0) {
        temp_r1_3 = M2C_FIELD(spC, u16 *, 0x5A) - M2C_FIELD(sp8, u16 *, 0x5C);
        M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 2) = temp_r1_3;
        if (temp_r1_3 < 0) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 2) = 0;
        }
        if ((s16) M2C_FIELD(spC, u16 *, 0x5A) == 0xFF) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 2) = 0xFFFF;
        }
        if (GetItemIndex(*sp24) == 0xB5) {
            M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 2) = 0xFFFF;
        }
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 0) = (u16) M2C_FIELD(sp8, u16 *, 0x6A);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 2) = (u16) M2C_FIELD(spC, u16 *, 0x6A);
    }
    if ((s16) M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 0) == 0xFF) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 0) = 0xFFFFU;
    }
    if ((s16) M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 2) == 0xFF) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 2) = 0xFFFFU;
    }
    if (GetItemIndex(*sp20) == 0xB5) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 0) = 0xFFFFU;
    }
    if (GetItemIndex(*sp24) == 0xB5) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 2) = 0xFFFFU;
    }
    if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) == 4) {
        M2C_FIELD((void *)((unsigned long)gEkrGaugeHit), u16 *, 2) = 0xFFFFU;
        M2C_FIELD((void *)((unsigned long)gEkrGaugeDmg), s16 *, 2) = -1;
        M2C_FIELD((void *)((unsigned long)gEkrGaugeCrt), u16 *, 2) = -1U;
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimExpPrevious), s16 *, 0) = (s16) (s8) M2C_FIELD(sp8, u8 *, 0x71);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimExpPrevious), s16 *, 2) = (s16) (s8) M2C_FIELD(spC, u8 *, 0x71);
    }
    if (temp_r7_2 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimExpGain), s16 *, 0) = (s16) (s8) M2C_FIELD(sp8, u8 *, 0x6E);
    }
    if (temp_r1 != 0) {
        M2C_FIELD((void *)((unsigned long)gBanimExpGain), s16 *, 2) = (s16) (s8) M2C_FIELD(spC, u8 *, 0x6E);
    }
    M2C_FIELD((void *)((unsigned long)gBanimWtaBonus), s16 *, 2) = 0;
    M2C_FIELD((void *)((unsigned long)gBanimWtaBonus), s16 *, 0) = 0;
    if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) != 4) {
        if (temp_r7_2 != 0) {
            M2C_FIELD((void *)((unsigned long)gBanimWtaBonus), s16 *, 0) = (s16) (s8) M2C_FIELD(sp8, u8 *, 0x53);
        }
        if (temp_r1 != 0) {
            M2C_FIELD((void *)((unsigned long)gBanimWtaBonus), s16 *, 2) = (s16) (s8) M2C_FIELD(spC, u8 *, 0x53);
        }
        if (temp_r7_2 != 0) {
            M2C_FIELD((void *)((unsigned long)gBanimEffectiveness), s16 *, 0) = (s16) IsUnitEffectiveAgainst(sp8, sp18);
        }
        if (temp_r1 != 0) {
            M2C_FIELD((void *)((unsigned long)gBanimEffectiveness), s16 *, 2) = (s16) IsUnitEffectiveAgainst(sp18, sp8);
        }
        if ((M2C_FIELD((void *)((unsigned long)gBanimEffectiveness), s16 *, 0) == 0) && (temp_r7_2 != 0)) {
            M2C_FIELD((void *)((unsigned long)gBanimEffectiveness), s16 *, 0) = (s16) IsItemEffectiveAgainst(*sp20, sp18);
        }
        if ((*(s16 *)((unsigned long)&gBanimEffectiveness[1]) == 0) && (temp_r1 != 0)) {
            M2C_FIELD((void *)((unsigned long)gBanimEffectiveness), s16 *, 2) = (s16) IsItemEffectiveAgainst(*sp24, sp8);
        }
    }
    M2C_FIELD((void *)((unsigned long)gBanimForceUnitChgDebug), s32 *, 4) = 0;
    M2C_FIELD((void *)((unsigned long)gBanimForceUnitChgDebug), s32 *, 0) = 0;
    if (temp_r7_2 != 0) {
        GetItemIndex(M2C_FIELD(sp8, u16 *, 0x4A));
    }
    if (temp_r1 != 0) {
        GetItemIndex(M2C_FIELD(spC, u16 *, 0x4A));
    }
    if ((GetBanimLinkArenaFlag() == 1) || ((*(u8 *)((unsigned long)&gPlaySt + 0x40) & 1) != 0)) {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePaletteDisabled), s16 *, 2) = 1;
        M2C_FIELD((void *)((unsigned long)gBanimUniquePaletteDisabled), s16 *, 0) = 1;
    } else {
        M2C_FIELD((void *)((unsigned long)gBanimUniquePaletteDisabled), s16 *, 2) = 0;
        M2C_FIELD((void *)((unsigned long)gBanimUniquePaletteDisabled), s16 *, 0) = 0;
    }
    *(s16 *)((unsigned long)&gBanimBG) = 0;
    if (GetBattleAnimPreconfType() == 3) {
        if (M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0) != 0) {
            var_r4_3 = M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 0);
        } else {
            var_r4_3 = M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 2);
        }
        *(s16 *)((unsigned long)&gBanimBG) = GetBanimBackgroundIndex(var_r4_3, M2C_FIELD(GetROMChapterStruct((s8) M2C_FIELD((void *)((unsigned long)&gPlaySt), u8 *, 0xE)), u8 *, 0x13));
    }
    if (CheckBanimHensei() == 1) {
        *(s16 *)((unsigned long)&gBanimBG) = 0x3C;
    }
    var_r4_4 = 0;
    if (GetBattleAnimPreconfType() == 0) {
        var_r4_4 = 1;
    }
    if (GetBattleAnimPreconfType() == 3) {
        var_r4_4 = 1;
    }
    if (GetBattleAnimPreconfType() == 1) {
        if ((s16) *(s16 *)((unsigned long)&gEkrDistanceType) == 4) {
            var_r4_4 = 1;
        }
        if (GetBattleAnimArenaFlag() == 1) {
            var_r4_4 = 1;
        }
        if (CheckBattleScripted() == 1) {
            var_r4_4 = 1;
        }
    }
    SetBattleUnscripted();
    if ((((s16) *(s16 *)((unsigned long)&gEkrDistanceType) != 4) && ((M2C_FIELD(sp8, s32 *, 0xC) & 0x800) || (M2C_FIELD(sp18, s32 *, 0xC) & 0x800))) || (var_r4_4 == 0) || ((M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 0) == 1) && (((0xF & M2C_FIELD(sp8, u8 *, 0x30)) == 4) || (M2C_FIELD((void *)((unsigned long)gBanimIdx_bak), s16 *, 0) == -1) || (M2C_FIELD((void *)((unsigned long)gEkrSpellAnimIndex), s16 *, 0) == -2) || ((s16) M2C_FIELD((void *)((unsigned long)gBanimFloorfx), u16 *, 0) == -1) || (temp_r0_10 = (s16) M2C_FIELD((void *)((unsigned long)gBanimTerrain), u16 *, 0), (temp_r0_10 == 0x1B)) || (temp_r0_10 == 0x33))) || ((M2C_FIELD((void *)((unsigned long)gBanimValid), s16 *, 2) == 1) && (((0xF & M2C_FIELD(sp18, u8 *, 0x30)) == 4) || (*(s16 *)((unsigned long)&gBanimIdx_bak[1]) == -1) || (*(s16 *)((unsigned long)&gEkrSpellAnimIndex[1]) == -2) || (*(s16 *)((unsigned long)&gBanimFloorfx[1]) == -1) || (temp_r0_11 = *(s16 *)((unsigned long)&gBanimTerrain[1]), (temp_r0_11 == 0x1B)) || (temp_r0_11 == 0x33)))) {
        return 0;
    }
    return 1;
}
