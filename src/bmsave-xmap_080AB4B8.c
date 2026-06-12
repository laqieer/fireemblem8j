#include "global.h"
#include "agb_sram.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "bmmap.h"
#include "bmlib.h"

 // 0x40000 = EWRAM_SIZE

void LoadAndVerfySuspendSave(void)
{
    struct PlaySt playSt;
    
    if (IsValidSuspendSave(SAVE_ID_SUSPEND)) {

        ReadSuspendSavePlaySt(SAVE_ID_SUSPEND, &playSt);
        if (0x7F == playSt.chapterIndex) {
            ReadSramFast(gpSramExtraData, &gExtraMapSaveHead, sizeof(struct ExtraMapSaveHead));

            if (playSt.unk_2C_0D != gExtraMapSaveHead.unk0F)
                InvalidateSuspendSave(SAVE_ID_SUSPEND);
        }
    }
}
