#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"

void UpdateBanimFrame(void)
{
    int val1;
    int bid, bid_pal, chara_pal;
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;
    struct BattleAnim * banim = banim_data;

    ++banim; --banim;
    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gBanimValid[EKR_POS_L] == true) {
        bid = gBanimIdx[EKR_POS_L];
        bid_pal = gBanimFactionPal[EKR_POS_L];
        chara_pal = gBanimUniquePal[EKR_POS_L];

        LZ77UnCompWram(banim[bid].script, gBanimScrLeft);
        gpBanimModesLeft = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 0)].pal, gBanimPaletteLeft);

        if (chara_pal != -1) {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteLeft);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteLeft, POS_L);
        }

        gpEfxUnitPaletteBackup[POS_L] = &PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[0], PAL_OBJ(0x8), 0x20);

        /* WTF a horrible bug... */
        if (gBattleActor.unit.statusIndex == 0xB || gBattleActor.unit.statusIndex == 0xD)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, (int)PAL_OBJ(0x7), 0x1);

        if (gBattleTarget.unit.statusIndex == 0xB || gBattleTarget.unit.statusIndex == 0xD)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, (int)PAL_OBJ(0x8), 0x1);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gBanimValid[EKR_POS_R] == true) {
        bid = gBanimIdx[EKR_POS_R];
        bid_pal = gBanimFactionPal[EKR_POS_R];
        chara_pal = gBanimUniquePal[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPaletteRight);

        if (chara_pal != -1) {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteRight);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_R);
        }

        gpEfxUnitPaletteBackup[POS_R] = &PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[1], PAL_OBJ(0xA), 0x20);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL) {
        {
            u16 pid, jid;
            u16 i;
            u16 idx = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[0], gpEkrTriangleUnits[0]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimTriAtkPalettes[0] = banim[idx].pal;

            pid = gpEkrTriangleUnits[0]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[0]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gAnimCharaPalConfig[pid][i] == jid) {
                    gBanimTriAtkPalettes[0] = cbapt[gAnimCharaPalIt[pid][i] - 1].pal;
                    break;
                }
            }
        }
        {
            u16 pid, jid;
            u16 i;
            u16 idx = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[1], gpEkrTriangleUnits[1]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimTriAtkPalettes[1] = banim[idx].pal;

            pid = gpEkrTriangleUnits[1]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[1]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gAnimCharaPalConfig[pid][i] == jid) {
                    gBanimTriAtkPalettes[1] = cbapt[gAnimCharaPalIt[pid][i] - 1].pal;
                    break;
                }
            }
        }
    }
}
