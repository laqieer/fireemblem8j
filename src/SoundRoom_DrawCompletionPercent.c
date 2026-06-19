#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"

struct Unknown201F148
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[7];
};
extern struct Unknown201F148 gUnk_SoundRoom_0;

void SoundRoom_DrawCompletionPercent(u16 * tm, struct SoundRoomProc * proc)
{
    PutText(&gUnk_SoundRoom_0.text[0], tm);
    PutNumber(
        tm + 6, (proc->completionPercent == 100) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        proc->completionPercent);
    PutText(&gUnk_SoundRoom_0.text[6], tm + 7);
    return;
}
