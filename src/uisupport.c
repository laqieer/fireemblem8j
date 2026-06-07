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







u16 CONST_DATA gSprite_SupportScreenSuccessBox[] = {
    6,
    0x4004, 0x8000, 0x0000,
    0x4004, 0x8020, 0x0004,
    0x4004, 0x8040, 0x0008,
    0x4014, 0x4000, 0x000C,
    0x4014, 0x4020, 0x0010,
    0x4014, 0x4040, 0x0014,
};

u16 CONST_DATA gSprite_SupportScreenBanner[] = {
    3,
    0x4000, 0xC000, 0x0000,
    0x0000, 0x8040, 0x0008,
    0x8000, 0x8060, 0x000C,
};

int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

//! FE8U = 0x080A10BC
void SupportScreen_OnInit(struct SupportScreenProc* proc) {
    proc->unk_2c = 0;
    proc->unk_40 = 0;
    proc->unk_34 = 0;
    proc->curIndex = 0;
    proc->unk_3c = -1;
    return;
}

//! FE8U = 0x080A10D0
void DrawSupportBannerSprites_Init(struct Proc* proc) {
    Decompress(gGfx_SupportMenu, (void*)0x06017800);
    ApplyPalette(gPal_SupportMenu, proc->unk34 + 0x10);
    return;
}

//! FE8U = 0x080A10FC
void DrawSupportBannerSprites_Loop(struct Proc* proc) {
    PutSpriteExt(4, proc->x, proc->y, gSprite_SupportScreenSuccessBox, (proc->unk34 & 0xf) * 0x1000 + 0xfc0);
    PutSpriteExt(4, 4, 0, gSprite_SupportScreenBanner, 0x21c0);
    return;
}
