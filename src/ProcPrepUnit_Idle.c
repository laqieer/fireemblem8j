#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"



void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc);
s8 PrepUnit_HandlePressA(struct ProcPrepUnit *proc);
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val);
void PrepUnit_DrawUnitItems(struct Unit *unit);
s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);
void PrepUpdateMenuTsaScroll(int val);
void PrepUnit_UpdateScrollArrows(struct ProcPrepUnit *proc);

void ProcPrepUnit_Idle(struct ProcPrepUnit *proc)
{
    int ret;

    if (proc->list_num_pre == proc->list_num_cur) {
        int key_pre = gKeyStatusPtr->repeatedKeys;

        proc->scroll_val = 4;
        if (L_BUTTON & gKeyStatusPtr->heldKeys) {
            key_pre = gKeyStatusPtr->heldKeys;
            proc->scroll_val = 8;
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys) {
            if (0 == proc->cur_counter) {
                PlaySoundEffect(SONG_6C);
            } else {
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                Proc_Goto(proc, PROC_LABEL_PREPUNIT_GAME_START);
            }
            return;
        }

        if (SELECT_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_SELECT);
            return;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_R);
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            ret = PrepUnit_HandlePressA(proc);
            if (ret)
                PrepUnit_DrawPickLeftBar(proc, 1);
            return;
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Goto(proc, PROC_LABEL_PREPUNIT_PRESS_B);
            return;
        }

        if (DPAD_LEFT & key_pre) {
            if (1 & proc->list_num_cur)
                proc->list_num_cur--;
        }

        if (DPAD_RIGHT & key_pre) {
            if (!(1 & proc->list_num_cur) && proc->list_num_cur < (PrepGetUnitAmount() - 1))
                proc->list_num_cur++;
        }

        if (DPAD_UP & key_pre) {
            if ((proc->list_num_cur - 2) >= 0)
                proc->list_num_cur -= 2;
        }

        if (DPAD_DOWN & key_pre) {
            if ((proc->list_num_cur + 2) <= (PrepGetUnitAmount() - 1))
                proc->list_num_cur += 2;
        }

        if (proc->list_num_pre == proc->list_num_cur)
            return;

        PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
        StartParallelFiniteLoop(PrepUnit_DrawLeftUnitNameCur, 1, proc);
        PlaySoundEffect(SONG_65);
    
        if (ShouldPrepUnitMenuScroll(proc)) {
            if (proc->list_num_cur < proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 - 1);
            if (proc->list_num_cur > proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 + 6);

            SetSysHandCursorXPos((1 & proc->list_num_cur) * 56 + 0x70);
        } else {
            proc->list_num_pre = proc->list_num_cur;
            ShowSysHandCursor(
                (1 & proc->list_num_pre) * 56 + 0x70,
                (proc->list_num_pre >> 1) * 16 + 0x18 - proc->yDiff_cur,
                0x7, 0x800
            );
        }
    
        if (proc->list_num_pre == proc->list_num_cur)
            return;
    }

    if (proc->list_num_cur < proc->list_num_pre)
        proc->yDiff_cur -= proc->scroll_val;

    if (proc->list_num_cur > proc->list_num_pre)
        proc->yDiff_cur += proc->scroll_val;

    if (0 == proc->yDiff_cur % 0x10) {
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 - 1);
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 + 6);
        PrepUnit_UpdateScrollArrows(proc);
        proc->list_num_pre = proc->list_num_cur;
    }

    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
    UpdateMenuScrollBarConfig(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
}
