#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "sioerror.h"
#include "constants/songs.h"


struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char* unk_2c;
    /* 30 */ struct Font* unk_30;

    /* 34 */ struct Text* unk_34[9]; // unknown size; 3?

    /* 58 */ int unk_58;
    /* 5C */ s16 unk_5c;
    /* 5E */ s16 unk_5e;
    /* 60 */ u16 unk_60;
    ///* 62 */ s16 unk_62; TODO - Harmonize with definition in "helpbox.c"
    ///* 64 */ s16 unk_64; TODO - Harmonize with definition in "helpbox.c"
};
void HelpBoxDrawOneLineExt(struct HelpBoxScrollProc * proc);

void PutSioErrorMessage(void) {
    int i;
    struct Text th[3];
    struct HelpBoxScrollProc localProcSt;

    struct HelpBoxScrollProc* proc = &localProcSt;

    ResetText();
    InitTalkTextFont();

    for (i = 0; i < 3; i++) {
        InitText(&th[i], 22);
        Text_SetColor(&th[i], 0);
    }

    proc->unk_30 = NULL;

    proc->unk_34[0] = &th[0];
    proc->unk_34[1] = &th[1];
    proc->unk_34[2] = &th[2];

    proc->unk_5c = 0;

    proc->unk_2c = GetStringFromIndex(0x82B);
    /*
    * TODO: msgid:
    *    "Linking error.
    *    Turn the power off, check[.]
    *    the connections, and retry.[.]"
    */

    HelpBoxDrawOneLineExt(proc);

    PutText(&th[0], gBG0TilemapBuffer + TILEMAP_INDEX(4,  6));
    PutText(&th[1], gBG0TilemapBuffer + TILEMAP_INDEX(4,  9));
    PutText(&th[2], gBG0TilemapBuffer + TILEMAP_INDEX(4, 11));

    BG_EnableSyncByMask(1);

    return;
}
