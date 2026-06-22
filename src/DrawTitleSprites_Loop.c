#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"

extern u16 CONST_DATA gSprite_Title_FireEmblemLogo[];
extern u16 CONST_DATA gSprite_Title_SacredStonesBanner[];
extern u16 CONST_DATA gSprite_Title_CopyrightInfo[];
extern u16 CONST_DATA gSprite_Title_PressStart[];
extern u16 CONST_DATA gSprite_Title_Extra[];

//! FE8U = 0x080C5440
void DrawTitleSprites_Loop(struct TitleScreenProc* proc) {

    PutSpriteExt(0, 0, 39, gSprite_Title_FireEmblemLogo, 0x2000);
    PutSpriteExt(0, 216, 39, gObject_16x16, 0x201E); // TM
    PutSpriteExt(2, 0, 1068, gSprite_Title_FireEmblemLogo, 0x20C0);
    PutSpriteExt(1, 60, 26, gSprite_Title_Extra, 0x11B0);
    PutSpriteExt(1, 56, 87, gSprite_Title_SacredStonesBanner, 0x31A0);
    PutSpriteExt(1, 80, 124, gSprite_Title_PressStart, 0x1F0);
    PutSpriteExt(1, 16, 148, gSprite_Title_CopyrightInfo, 0x1180);

    if (DivRem(proc->unk_4c, 3) == 0) {
        proc->unk_52 = (proc->unk_52 + 1) & 0x1f;
    }

    if ((proc->unk_52 & 0x10) != 0) {
        CopyToPaletteBuffer(gPal_Titlescreen_0 + (proc->unk_52 & 0xf), 0x210, 2);
    } else {
        CopyToPaletteBuffer(gPal_Titlescreen_0 + ((0x1f - proc->unk_52) & 0xf), 0x210, 2);
    }

    proc->unk_4c++;
}
