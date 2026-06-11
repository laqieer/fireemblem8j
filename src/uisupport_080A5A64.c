#include "global.h"

#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;

extern EWRAM_OVERLAY(0) int sSupportScreenUnitCount;
extern EWRAM_OVERLAY(0) u16 gUisupport_0[0xC00];
extern EWRAM_OVERLAY(0) u16 gUisupport_1[0x2706];

extern u16 CONST_DATA gSprite_SupportScreenSuccessBox[];

extern u16 CONST_DATA gSprite_SupportScreenBanner[];

int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

/* prototypes for same-file helpers called by this run */
int GetSupportScreenPartnerCharId(int idx, int partner);
int GetSupportScreenCharIdAt(int idx);

//! FE8U = 0x080A1C8C
void DrawSupportSubScreenUnitPartnerText(struct SubScreenProc* proc, int idx) {

    int _y;
    int i;
    int unitCharId;
    int partnerCharId;

    int supportLvCharLut[3] = {
        TEXT_SPECIAL_C,
        TEXT_SPECIAL_B,
        TEXT_SPECIAL_A,
    };

    if (proc->partnerState[idx] == 0) {
        for (i = 0; i < 5; i++) {
            PutSpecialChar(gBG2TilemapBuffer + TILEMAP_INDEX(0x10 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        }

        for (i = 0; i < 2; i++) {
            PutSpecialChar(gBG2TilemapBuffer + TILEMAP_INDEX(0x16 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        }

        for (i = 0; i < 3; i++) {
            PutSpecialChar(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        }
    } else {
        int color = 0;

        unitCharId = GetSupportScreenCharIdAt(proc->unitIdx);
        partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, idx);

        if (proc->partnerState[idx] == 2) {
            color = 1;
        }

        PutDrawText(
            0,
            gBG2TilemapBuffer + TILEMAP_INDEX(16, 0) + (_y = ((idx * 2) + 3) * 0x20),
            color,
            0,
            5,
            GetStringFromIndex(gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].nameTextId)
        );

        DrawIcon(
            gBG2TilemapBuffer + TILEMAP_INDEX(16, 0) + TILEMAP_INDEX(6, (idx * 2) + 3),
            gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].affinity + 0x79,
            0xe000
        );

        if (GetUnitsAverageSupportValue(unitCharId, partnerCharId) == 2) {
            for (i = 0; i < 2; i++) {
                color = 1;
                if (proc->supportLevel[idx] == 2) {
                    color = 4;
                } else if (proc->supportLevel[idx] > i) {
                    color = 0;
                }

                PutSpecialChar(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, (idx * 2) + 3), color, supportLvCharLut[i]);
            }

            PutSpecialChar(gBG2TilemapBuffer + 0x1B + (((idx * 2) + 3) * 0x20), TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        } else {

            for (i = 0; i < 3; i++) {
                color = 1;
                if (proc->supportLevel[idx] == 3) {
                    color = 4;
                } else if (proc->supportLevel[idx] > i) {
                    color = 0;
                }

                PutSpecialChar(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, (idx * 2) + 3), color, supportLvCharLut[i]);
            }
        }
    }
    return;
}
