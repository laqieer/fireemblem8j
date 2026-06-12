#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "ap.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void ManimLevelUp_PutStatGainLabels(struct ManimLevelUpProc * proc)
{
    int stat_num;

    if (proc->clock != 0) {
        proc->clock--;
        return;
    }

    for (stat_num = proc->next_stat_num; stat_num < 9; stat_num++) {
        if (GetManimLevelUpStatGain(proc->actor_id, stat_num) != 0)
            break;
    }

    if (stat_num >= 9) {
        Proc_Break(proc);
        return;
    }

    PutManimLevelUpStat(proc->actor_id, 1, 1, stat_num, true);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    StartManimLevelUpStatGainLabelAnim(
        gManimLevelUpLabelInfoList[stat_num].x * 8 + 62,
        gManimLevelUpLabelInfoList[stat_num].y * 8 + 23 - proc->y_scroll_offset,
        stat_num, GetManimLevelUpStatGain(proc->actor_id, stat_num));

    if (stat_num == 0) {
        PlaySoundEffect(SONG_2CD);
    } else {
        PlaySoundEffect(SONG_76);
    }

    proc->next_stat_num = stat_num + 1;
    proc->clock = 20;
}
