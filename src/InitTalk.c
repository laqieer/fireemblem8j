#include "global.h"

#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

extern struct TalkState * CONST_DATA sTalkState;
extern struct Text sTalkText[3];
extern struct Font sTalkFont;
extern u8 CONST_DATA Img_TalkBubble[];

//! FE8U = 0x08006710
void InitTalk(int chr, int lines, s8 unpackBubble) {
    int i;
    int ub = unpackBubble;

    InitTextFont(&sTalkFont, (void*)(VRAM + GetBackgroundTileDataOffset(0) + (0x3FF & chr) * 0x20), chr, 2);
    SetInitTalkTextFont();

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        InitText(sTalkText + i, 30);
        Text_SetColor(sTalkText + i, 1);
    }

    if (ub != 0) {
        Decompress(Img_TalkBubble, (void*)(GetBackgroundTileDataOffset(BG_1) + 0x06000200));
        ApplyPalette(Pal_TalkBubble, 3);
    }

    ClearTalkFaceRefs();

    return;
}
