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

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;

extern EWRAM_OVERLAY(0) int sSupportScreenUnitCount;
extern EWRAM_OVERLAY(0) u16 gUisupport_0[0xC00];
extern EWRAM_OVERLAY(0) u16 gUisupport_1[0x2706];

extern u16 CONST_DATA gSprite_SupportScreenSuccessBox[];

extern u16 CONST_DATA gSprite_SupportScreenBanner[];

int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

/* prototypes for same-file helpers called by this run */
int GetSupportScreenUnitCount(void);
int GetSupportScreenCharIdAt(int idx);
int GetSupportScreenUnitSupportStatus(s8 flag, int idx);

//! FE8U = 0x080A199C
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc* proc, int param_2) {
    int i;
    int j;
    int x;
    int y;
    int color;
    struct Text* textPtr;

    SetTextFontGlyphs(0);
    SetTextFont(0);

    textPtr = gPrepItemTexts + ((param_2 * 3) % 0x15);
    for (i = 0, j = (param_2 * 3); i < 3; textPtr++, j++, i++) {
        ClearText(textPtr);

        if ((j) < GetSupportScreenUnitCount()) {
            x = ((i) % 3) * 8;
            y = ((param_2 * 2)) & 0x1f;

            switch (GetSupportScreenUnitSupportStatus(proc->fromPrepScreen, (j))) {
                case 0:
                    color = 1;
                    break;
                case 1:
                    color = 0;
                    break;
                case 2:
                    color = 4;
                    break;
            }

            Text_SetCursor(textPtr, 0);
            Text_SetColor(textPtr, color);

            Text_DrawString(
                textPtr,
                GetStringFromIndex(gCharacterData[GetSupportScreenCharIdAt((j)) - 1].nameTextId)
            );

            PutText(
                textPtr,
                gBG2TilemapBuffer + TILEMAP_INDEX(x, y)
            );
        }
    }

    BG_EnableSyncByMask(4);

    return;
}
