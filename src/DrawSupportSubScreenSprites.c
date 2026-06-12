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
/* TU-private data externs bound at their JP addresses */
extern u16 gSprite_SupportScreenSuccessBox[];
extern u16 sSprite_BackButton[];
extern u16 sSprite_NameAffinLv[];
extern u16 sSprite_Uisupport_0[];
extern u16 sSprite_Uisupport_1[];

//! FE8U = 0x080A1B90
void DrawSupportSubScreenSprites(struct SubScreenProc* proc) {
    int oam2;
    int i;
    int x;
    int y;

    PutSpriteExt(4, (proc->x + 128) & 0x1FF, 8, sSprite_NameAffinLv, 0x23c0);
    PutSpriteExt(4, (proc->x + 32) & 0x1FF, 80, sSprite_Uisupport_0, 0xE280);
    PutSpriteExt(4, (proc->x + 5) & 0x1FF, 103, gSprite_SupportScreenSuccessBox, 0xABC0);
    PutSpriteExt(4, (proc->x + 20) & 0x1FF, 111, sSprite_Uisupport_1, 0xE280);
    PutSpriteExt(4, (proc->x + 12) & 0x1FF, 144, sSprite_BackButton, 0x2bc0);

    x = (proc->x + 112) & 0x1FF;
    y = (proc->y + 22);

    for (i = 0; i < proc->partnerCount; i++) {
        oam2 = 0xc000;

        if (proc->partnerState[i] == 0) {
            oam2 = 0xd000;
        }

        if (proc->partnerState[i] == 2) {
            oam2 = 0xf000;
        }

        PutUnitSpriteForClassId(
            0,
            x,
            y + (i * 16),
            oam2 | 0xc00,
            proc->partnerClassId[i]
        );
    }

    SyncUnitSpriteSheet();

    return;
}
