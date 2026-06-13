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

void SetBonusItemClaimed(int idx);

//! FE8U = 0x080B0D38
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc * proc)
{
    u16 tmp;
    struct BonusClaimEnt* ent;

    int curIdx = proc->menuIndex;

    if (proc->unk_2e == 0) {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            int itemIdx = gpBonusClaimItemList[curIdx].unk_00;

            if (((1 << itemIdx) & GetBonusContentClaimFlags()) != 0) {
                StartBonusClaimHelpBox(-1, -1, 0x82C, proc); // TODO: msgid "Already used"
                return;
            }

            if (proc->targets != 0) {
                struct BonusClaimEnt* ent2 = gpBonusClaimData;
                ent2 += itemIdx;

                switch (ent2->kind) {
                    case BONUSKIND_ITEM0:
                    case BONUSKIND_ITEM1:
                        Proc_Goto(proc, 1);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

                    default:
                        return;

                    case BONUSKIND_MONEY:
                        if (ent2->itemId == ITEM_3000G) {
                            AddPartyGoldAmount(3000);
                        }

                        ent = &gpBonusClaimData[itemIdx];
                        if (ent->itemId == ITEM_5000G) {
                            AddPartyGoldAmount(5000);
                        }

                        SetBonusItemClaimed(proc->menuIndex);
                        DrawBonusClaimItemText(proc->menuIndex);

                        Proc_Goto(proc, 2);

                        return;
                }
            }

            PlaySoundEffect(SONG_6C);

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Break(proc);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            curIdx -= 1;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            curIdx += 1;
        }

        if (proc->menuIndex != curIdx) {
            if (curIdx >= 0) {

                if (curIdx >= *gpBonusClaimItemCount) {
                    return;
                }

                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

                proc->menuIndex = curIdx;

                if ((proc->menuIndex * 16 - proc->unk_2c == 0) && (proc->menuIndex != 0)) {
                    proc->unk_2e = -1;
                    DrawBonusClaimItemText(proc->menuIndex - 1);
                } else if ((proc->menuIndex * 16 - proc->unk_2c == 64) && (proc->menuIndex < *gpBonusClaimItemCount - 1)) {
                    proc->unk_2e = 1;
                    DrawBonusClaimItemText(proc->menuIndex + 1);
                } else {
                    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);
                }
            } else {
                return;
            }
        }

        if (proc->unk_2e == 0) {
            return;
        }
    }

    if (proc->unk_2e < 0) {
        proc->unk_2c -= 4;
    }

    if (proc->unk_2e > 0) {
        proc->unk_2c += 4;
    }

    tmp = (proc->unk_2c);
    tmp &= 0xf;

    if (tmp == 0) {
        proc->unk_2e = 0;
    }

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    UpdateMenuScrollBarConfig(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    return;
}
