/* RAW, UNMODIFIED m2c decompilation of asm/sub_80C05C8.s -- kept verbatim for
 * provenance/audit. Generated with:
 *
 *   scripts/tools/m2c/m2c.sh --context tools/m2c/fe8j_ctx.c \
 *       -f GmapScreen2_Loop asm/sub_80C05C8.s
 *
 * This file is NOT compiled by CBMC and is NOT valid standalone C (raw m2c
 * output uses placeholder `?` types, ambiguous stack-slot structs, and
 * pointer arithmetic on `void *`/untyped globals that require a real project
 * header context to resolve). It exists solely so the cleaned reference used
 * in harness.c (`ref_fn`) can be diffed against the tool's actual output --
 * see the "m2c CLEANUP LOG" comment at the top of harness.c for the exact,
 * enumerated differences (2 real bugs fixed, 1 cosmetic stack-slot rename).
 */

? AP_Update(s32, s32, u8);                          /* extern */
s32 GmapScreen2_GetNodeScreenPos(void *, s16, s16, ? *, void *); /* extern */
? PutSpriteExt(s32, s16, s16, s32, s32);            /* extern */
extern ? gWMNodeData;
extern ? gWMNodeIconData;

void GmapScreen2_Loop(void *arg0, ? arg3) {
    ? sp4;
    u16 sp8;
    u32 spC;
    u8 *sp10;
    s16 temp_r0_2;
    s32 var_r0_2;
    s32 var_r8;
    u8 temp_r0;
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

    if (!(1 & arg0->unk32)) {
        return;
    }
    spC = (u32) arg0->unk2C >> 5;
    var_r8 = 0;
    sp10 = arg0 + 0x32;
    do {
        temp_r2 = ((var_r8 * 4) + 0x03005270)->unk30;
        if (1 & temp_r2) {
            temp_r6 = (var_r8 << 5) + &gWMNodeData;
            if (2 & temp_r2) {
                var_r0 = temp_r6->unk2;
            } else {
                var_r0 = temp_r6->unk3;
            }
            temp_r5 = (var_r0 * 0x10) + &gWMNodeIconData;
            if ((GmapScreen2_GetNodeScreenPos(arg0->unk3C, (s16) (temp_r6->unk18 - temp_r5->unk8), (s16) (temp_r6->unk1A - temp_r5->unk9), &sp4, &subroutine_arg0 + 6) << 0x18) != 0) {
                sp4.unk0 = (u16) (sp4.unk0 & 0x1FF);
                temp_r3 = subroutine_arg0.unk6;
                subroutine_arg0.unk6 = (s16) temp_r3;
                var_r0_2 = var_r8;
                if (var_r0_2 < 0) {
                    var_r0_2 += 0x1F;
                }
                if (*(arg0 + 0x34 + ((var_r0_2 >> 5) * 4)) & (1 << (0x1F & var_r8))) {
                    subroutine_arg0.unk6 = (s16) (temp_r3 | 0x400);
                }
                PutSpriteExt(0xC, (s16) sp4.unk0, (s16) subroutine_arg0.unk6, temp_r5->unk4, spC + temp_r5->unk0 + ((0xF & arg0->unk30) << 0xC) + 0x800);
            }
        }
        var_r8 += 1;
    } while (var_r8 <= 0x1C);
    if (2 & *sp10) {
        temp_r0 = arg0->unk33;
        temp_r6_2 = (temp_r0 << 5) + &gWMNodeData;
        if (2 & ((temp_r0 * 4) + 0x03005270)->unk30) {
            var_r0_3 = temp_r6_2->unk2;
        } else {
            var_r0_3 = temp_r6_2->unk3;
        }
        temp_r5_2 = (var_r0_3 * 0x10) + &gWMNodeIconData;
        temp_r1 = arg0->unk3C;
        sp8 = temp_r1->unk34;
        subroutine_arg0.unkA = (u16) temp_r1->unk36;
        sp4.unk0 = (u16) ((temp_r5_2->unkC + (temp_r6_2->unk18 - temp_r5_2->unk8)) - sp8);
        temp_r0_2 = (temp_r5_2->unkD + (temp_r6_2->unk1A - temp_r5_2->unk9)) - subroutine_arg0.unkA;
        sp4.unk2 = temp_r0_2;
        if (((u32) (u16) (temp_r0_2 + 0x20) <= 0xDFU) && ((u32) ((sp4.unk0 + 0x20) << 0x10) <= 0x012F0000U)) {
            var_r6 = (u8) sp4.unk2;
            temp_r3_2 = arg0->unk33;
            if (*(arg0 + 0x34 + ((temp_r3_2 >> 5) * 4)) & (1 << (temp_r3_2 & 0x1F))) {
                var_r6 |= 0x400;
            }
            AP_Update(arg0->unk38, 0x1FF & sp4.unk0, var_r6);
        }
    }
}
