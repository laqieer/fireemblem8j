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

void SupportScreen_Loop_KeyHandler(struct SupportScreenProc* proc) {
    u16 keys;
    int previous;
    int var;

    if (GetSupportScreenUnitCount()) {
        if (!proc->unk_40) {
            previous = proc->curIndex;

            keys = gKeyStatusPtr->repeatedKeys;
            proc->unk_41 = 4;

            if (gKeyStatusPtr->heldKeys & L_BUTTON) {
                keys = gKeyStatusPtr->heldKeys;
                proc->unk_41 = 8;
            }

            if (proc->helpTextActive) {
                if (gKeyStatusPtr->newKeys & B_BUTTON /* JP: B only, not R+B */) {
                    CloseHelpBox();
                    proc->helpTextActive = 0;
                    return;
                }
            } else {
                if (gKeyStatusPtr->newKeys & R_BUTTON) {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 20,
                        ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36,
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId
                    );

                    proc->helpTextActive = 1;

                    return;
                }

                if (gKeyStatusPtr->newKeys & A_BUTTON) {
                    Proc_Goto(proc, 2);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    return;
                }

                if (gKeyStatusPtr->newKeys & B_BUTTON) {
                    Proc_Goto(proc, 3);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                    return;
                }
            }

            if (keys & DPAD_LEFT) {
                if ((proc->curIndex % 3) != 0) {
                    proc->curIndex--;
                }
            }

            if (keys & DPAD_RIGHT) {
                if ((proc->curIndex % 3) != 2) {
                    proc->curIndex++;

                    if (proc->curIndex >= GetSupportScreenUnitCount()) {
                        proc->curIndex = GetSupportScreenUnitCount() - 1;
                    }
                }
            }

            if ((keys & DPAD_UP) && (proc->curIndex > 2)) {
                proc->curIndex -= 3;
            }

            if ((keys & DPAD_DOWN) && (proc->curIndex + 3 < GetSupportScreenUnitCount())) {
                proc->curIndex += 3;
            }

            if (previous != proc->curIndex) {
                var = ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16;

                proc->unk_40 = 0;
                PlaySoundEffect(SONG_65);

                if ((var < 0x10) && (proc->unk_34 != 0)) {
                    SupportScreen_DrawUnitNameRow(proc, (proc->unk_34 / 16) - 1);
                    proc->unk_40 = -1;
                    SetSysHandCursorXPos((proc->curIndex % 3) * 64 + 20);
                } else if ((var >= 0x50) && (proc->unk_34 != ((((GetSupportScreenUnitCount() - 1) / 3) - 5) * 16))) {
                    SupportScreen_DrawUnitNameRow(proc, (proc->unk_34 / 16) + 6);
                    proc->unk_40 = 1;
                    SetSysHandCursorXPos((proc->curIndex % 3) * 64 + 20);
                } else {

                    ShowSysHandCursor(
                        (proc->curIndex % 3) * 64 + 20,
                        var + 36,
                        7,
                        0x800
                    );
                }

                if (proc->helpTextActive != 0) {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 0x14,
                        ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36 - (proc->unk_40 * 16),
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId
                    );
                }
            }

            if (proc->unk_40 == 0) {
                return;
            }
        }

        if (proc->unk_40 < 0) {
            proc->unk_34 -= proc->unk_41;
        }

        if (proc->unk_40 > 0) {
            proc->unk_34 += proc->unk_41;
        }

        if ((proc->unk_34 & 0xf) == 0) {
            proc->unk_40 = 0;
        }

        UpdateMenuScrollBarConfig(10, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 6);

        BG_SetPosition(2, 0x0000FFD8, (proc->unk_34 - 36) & 0xff);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }

    return;
}
