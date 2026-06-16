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

extern struct SupportScreenUnit *  sSupportScreenUnits;

void SupportScreen_SetupUnits(struct SupportScreenProc* proc) {
    int k;
    int j;

    CpuFill16(0, sSupportScreenUnits, 0xC00);

    sSupportScreenUnitCount = 0;

    if (proc->fromPrepScreen) {
        int i;

        u32 unitFlags[8];
        CpuFill16(0, unitFlags, 0x20);

        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            *(unitFlags + (unit->pCharacterData->number >> 5)) |= (1 << (unit->pCharacterData->number & 0x1f));
        }

        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            if (!GetSupportScreenPartnerCount(unit->pCharacterData->number)) {
                continue;
            }

            sSupportScreenUnits[sSupportScreenUnitCount].charId = unit->pCharacterData->number;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = unit->pClassData->number;

            for (j = 0; j < gCharacterData[unit->pCharacterData->number - 1].pSupportData->supportCount; j++) {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, j);

                sSupportScreenUnits[sSupportScreenUnitCount].supportLevel[j] = GetUnitSupportLevel(unit, j);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[j] = GetSupportClassForCharId(charId);

                // BUG: This seems to have been intended to be an array of which of this unit's
                // support partners are dead/alive, but it indexes into this array with an uninitialized variable
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = (*(unitFlags + (charId >> 5)) >> (charId & 0x1f)) & 1;
            }

            sSupportScreenUnitCount++;
        }
    } else {
        struct GlobalSaveInfo GlobalSaveInfo;
        ReadGlobalSaveInfo(&GlobalSaveInfo);

        SetTacticianName(GetStringFromIndex(0x1F1)); // TODO: msgid "Mark"

        for (j = 0; j < 0x100; j++) {
            if (!GGM_IsCharacterKnown(j, &GlobalSaveInfo)) {
                continue;
            }

            if (!GetSupportScreenPartnerCount(j)) {
                continue;
            }

            sSupportScreenUnits[sSupportScreenUnitCount].charId = j;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = gCharacterData[j - 1].defaultClass;

            GetGlobalSupportListFromSave(j, sSupportScreenUnits[sSupportScreenUnitCount].supportLevel, &GlobalSaveInfo);

            for (k = 0; k < GetSupportScreenPartnerCount(j); k++) {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, k);

                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[k] = gCharacterData[charId - 1].defaultClass;
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = GGM_IsCharacterKnown(charId, &GlobalSaveInfo);
            }

            sSupportScreenUnitCount++;
        }
    }

    return;
}
