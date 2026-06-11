#include "global.h"
#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

u8 IsValidSuspendSave(int slot);
void ReadSuspendSavePlaySt(int slot, struct PlaySt *buf);

void InvalidateGameSave(int index)
{
    struct SaveBlockInfo chunk;
    struct PlaySt play_st;

    if (IsValidSuspendSave(SAVE_ID_SUSPEND)) {
        ReadSuspendSavePlaySt(SAVE_ID_SUSPEND, &play_st);

        if (play_st.gameSaveSlot == index)
            InvalidateSuspendSave(SAVE_ID_SUSPEND);
    }

    chunk.kind = SAVEBLOCK_KIND_INVALID;
    WriteSaveBlockInfo(&chunk, index);
}
