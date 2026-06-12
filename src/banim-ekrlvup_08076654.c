#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup *proc, int index);

void EkrLvup_MainAnime(struct ProcEkrLevelup *proc)
{
    int base, diff;
    s16 stat_index;

    if (++proc->timer == 0x14) {
        proc->timer = 0;

        for (; proc->index != EKRLVUP_STAT_MAX; proc->index++) {
            base = gEkrLvupBaseStatus[proc->index];
            diff = gEkrLvupPostStatus[proc->index] - base;

            if (diff != 0) {
                gEkrLvupBaseStatus[proc->index] = gEkrLvupPostStatus[proc->index];
                EkrLvup_DrawUpdatedStatus(proc, proc->index);
                EfxPlaySE(SONG_76, 0x100);
                M4aPlayWithPostionCtrl(SONG_76, 0x38, 0);

                BanimDrawStatupAp(0xA0, 1,
                    0x35 + (sEfxLvupPartsPos[proc->index] & 0x1F) * 8,
                    6 + (sEfxLvupPartsPos[proc->index] & 0x7E0) / 4,
                    proc->index + 1,
                    diff);

                if (proc->index == EKRLVUP_STAT_HP) {
                    gBanimMaxHP[1] = gEkrLvupBaseStatus[proc->index];
                    gEkrGaugeHpBak[1] = -1;
                }
                proc->timer = 0;
                break;
            }
        }
    }

    if (proc->index == EKRLVUP_STAT_MAX) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
