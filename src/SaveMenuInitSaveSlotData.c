#include "global.h"
#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

//! FE8U = 0x080ABC14
void SaveMenuInitSaveSlotData(u8 slot, struct SaveMenuProc * proc)
{
    struct PlaySt playSt;
    struct GMapData worldMapData;
    u8 localbuffer[4] __attribute__((unused));

    if (slot < 3)
    {
        if (IsSaveValid(slot))
        {
            int chIndex;
            int ch_idx;
            ReadGameSavePlaySt(slot, &playSt);

            ch_idx = playSt.chapterIndex;
            if (!(playSt.chapterStateBits & PLAY_FLAG_COMPLETE) && (playSt.save_menu_type == 4))
            {
                LoadSavedWMStuff(slot, &worldMapData);
                ch_idx = GetChapterIndexOnWmNode(&worldMapData);
            }

            chIndex = playSt.chapterIndex;
            playSt.chapterIndex = ch_idx;
            proc->chapter_idx[slot] = GetChapterTitleExtra(&playSt);

            playSt.chapterIndex = chIndex;
            proc->played_time[slot] = playSt.time_saved;
            proc->unk_3a[slot] = 0;

            // BUG?
            if (IsGameNotFirstChapter((struct PlaySt *)(uintptr_t)slot) != 0)
                proc->unk_3a[slot] |= 1;

            if (LoadSavedEid8A(slot) != 0)
                proc->unk_3a[slot] |= 2;

            if (playSt.chapterStateBits & PLAY_FLAG_COMPLETE)
                proc->unk_3a[slot] |= 4;

            gPlayStChapterBits[slot] = playSt.chapterStateBits;
            gPlayStChapterMode[slot] = playSt.chapterModeIndex;
            memcpy(&gPlayStOptionBits[slot], &playSt.config, 8);
        }
        else
        {
            proc->chapter_idx[slot] = (u8)-1;
            proc->unk_3a[slot] = 0;
            proc->played_time[slot] = 0;

            gPlayStChapterBits[slot] = 0;
            gPlayStChapterMode[slot] = 0;

            memset(&gPlayStOptionBits[slot], 0, 8);
        }
    }
    else if (proc->unk_44 == 0x100)
    {
        if (IsValidSuspendSave(3))
        {
            ReadSuspendSavePlaySt(3, &playSt);
            proc->sus_slot_cur = playSt.gameSaveSlot;
            proc->total_time = playSt.time_saved;
        }
        else
        {
            proc->unk_44 = 0xf0;
        }
    }

    return;
}
