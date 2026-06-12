extern int LoadBonusContentData();
#include "global.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8U = 0x080B0760
s8 InitBonusClaimData(void) {
    int i;

    int count = 0;

    CpuFill16(0, gpBonusClaimItemList, 0x80);
    CpuFill16(0, gpBonusClaimData, 0x144);

    if (LoadBonusContentData(gpBonusClaimData) != 0) {
        CpuFastCopy(gpBonusClaimData, gpBonusClaimDataUpdated, 0x144);

        for (i = 0; i < 0x10; i++) {
            struct BonusClaimEnt* ent = &gpBonusClaimData[i];
            struct BonusClaimEnt* ent2;

            if ((ent->unseen & 3) == 0) {
                continue;
            }

            switch (ent->kind) {
                case BONUSKIND_ITEM1:
                    if ((gPlaySt.unk_2B_00) == 0) {
                        continue;
                    }

                case BONUSKIND_ITEM0:
                case BONUSKIND_MONEY:
                    gpBonusClaimItemList[count].unk_00 = i;

                    if (((1 << i) & GetBonusContentClaimFlags()) != 0) {
                        gpBonusClaimItemList[count].claimable = 0;
                    } else {
                        gpBonusClaimItemList[count].claimable = 1;
                    }

                    count++;

                    break;
            }

            ent2 = &gpBonusClaimData[i];
            if ((ent2->unseen & 3) == 1) {
                struct BonusClaimEnt* ent3 = &gpBonusClaimDataUpdated[i];
                ent3->unseen = (ent3->unseen & 0xfc) + 2;
            }
        }

        *gpBonusClaimItemCount = count;

        SaveBonusContentData(gpBonusClaimDataUpdated);
    }

    if (count == 0) {
        return 0;
    }

    return 1;
}
