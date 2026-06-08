#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"

#include "bm.h"

#include "constants/event-flags.h"
#include "constants/songs.h"


struct BmSt EWRAM_DATA gBmSt = {};
struct PlaySt EWRAM_DATA gPlaySt = {};
struct Vec2 EWRAM_DATA sLastCoordMapCursorDrawn = {};
u32 EWRAM_DATA sLastTimeMapCursorDrawn = 0;



s8 CONST_DATA sDirKeysToOffsetLut[][2] = {
    {  0,  0, }, // 0000 none
    { +1,  0, }, // 0001 right
    { -1,  0, }, // 0010 left
    {  0,  0, }, // 0011 right + left
    {  0, -1, }, // 0100 up
    { +1, -1, }, // 0101 up + right
    { -1, -1, }, // 0110 up + left
    {  0,  0, }, // 0111 up + right + left
    {  0, +1, }, // 1000 down
    { +1, +1, }, // 1001 down + right
    { -1, +1, }, // 1010 down + left
    {  0,  0, }, // 1011 down + right + left
    {  0,  0, }, // 1100 down + up
    {  0,  0, }, // 1101 down + up + right
    {  0,  0, }, // 1110 down + up + left
    {  0,  0, }, // 1111 down + up + right + left
};

u16 CONST_DATA sSprite_MapCursorA[] = {
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(252), OAM1_SIZE_8x8 + OAM1_X(510),                          0,
    OAM0_SHAPE_8x8 + OAM0_Y(252), OAM1_SIZE_8x8 + OAM1_X(10) + OAM1_HFLIP,              0,
    OAM0_SHAPE_8x8 + OAM0_Y(9),   OAM1_SIZE_8x8 + OAM1_X(510) + OAM1_VFLIP,             0,
    OAM0_SHAPE_8x8 + OAM0_Y(9),   OAM1_SIZE_8x8 + OAM1_X(10) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA sSprite_MapCursorB[] = {
4,
    OAM0_SHAPE_8x8 + OAM0_Y(253), OAM1_SIZE_8x8 + OAM1_X(511),                          0,
    OAM0_SHAPE_8x8 + OAM0_Y(253), OAM1_SIZE_8x8 + OAM1_X(9) + OAM1_HFLIP,               0,
    OAM0_SHAPE_8x8 + OAM0_Y(8),   OAM1_SIZE_8x8 + OAM1_X(511) + OAM1_VFLIP,             0,
    OAM0_SHAPE_8x8 + OAM0_Y(8),   OAM1_SIZE_8x8 + OAM1_X(9) + OAM1_HFLIP + OAM1_VFLIP,  0,
};

u16 CONST_DATA sSprite_MapCursorC[] = {
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(254), OAM1_SIZE_8x8,                                        0,
    OAM0_SHAPE_8x8 + OAM0_Y(254), OAM1_SIZE_8x8 + OAM1_X(8) + OAM1_HFLIP,               0,
    OAM0_SHAPE_8x8 + OAM0_Y(7),   OAM1_SIZE_8x8 + OAM1_VFLIP,                           0,
    OAM0_SHAPE_8x8 + OAM0_Y(7),   OAM1_SIZE_8x8 + OAM1_X(8) + OAM1_HFLIP + OAM1_VFLIP,  0,
};

u16 CONST_DATA sSprite_MapCursorStretched[] = {
    4,
    OAM0_SHAPE_8x8 + OAM0_Y(248), OAM1_SIZE_8x8 + OAM1_X(508),                          0,
    OAM0_SHAPE_8x8 + OAM0_Y(248), OAM1_SIZE_8x8 + OAM1_X(12) + OAM1_HFLIP,              0,
    OAM0_SHAPE_8x8 + OAM0_Y(10),  OAM1_SIZE_8x8 + OAM1_X(508) + OAM1_VFLIP,             0,
    OAM0_SHAPE_8x8 + OAM0_Y(10),  OAM1_SIZE_8x8 + OAM1_X(12) + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16* CONST_DATA sMapCursorSpriteLut[] = {
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,
    sSprite_MapCursorA,

    sSprite_MapCursorB,

    sSprite_MapCursorC,
    sSprite_MapCursorC,
    sSprite_MapCursorC,
    sSprite_MapCursorC,

    sSprite_MapCursorB,
};

























//! FE8U = 0x08015608
void InitBmBgLayers(void) {

    if (gPlaySt.chapterWeatherId == WEATHER_CLOUDS) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 2;
    } else {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    return;
}

//! FE8U = 0x08015680
void LoadObjUIGfx(void) {
    Decompress(gGfx_MiscUiGraphics, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void*)0x06010000, 0x12, 4);

    ApplyPalettes(gPal_MiscUiGraphics, 0x10, 2);

    return;
}

//! FE8U = 0x080156BC
void ApplySystemObjectsPalettes(void) {
    ApplyPalettes(gPal_MiscUiGraphics, 0x10, 2);
    return;
}

//! FE8U = 0x080156D4
void LoadGameCoreGfxLegacyFrame(void) {

    ResetText();
    LoadLegacyUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x080156F4
void ReadGameSaveCoreGfx(void) {

    ResetText();
    LoadUiFrameGraphics();
    ResetFaces();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    return;
}

//! FE8U = 0x08015714
void HandleMapCursorInput(u16 keys) {
    int dir = (keys >> 4) & (DPAD_ANY >> 4);

    struct Vec2 newCursor = {
        gBmSt.playerCursor.x + sDirKeysToOffsetLut[dir][0],
        gBmSt.playerCursor.y + sDirKeysToOffsetLut[dir][1]
    };

    if (gBmSt.gameStateBits & (1 << 1)) {
        if ((gBmMapMovement[gBmSt.playerCursor.y][gBmSt.playerCursor.x] < MAP_MOVEMENT_MAX)) {
            if (gBmMapMovement[newCursor.y][newCursor.x] >= MAP_MOVEMENT_MAX) {
                if ((keys & DPAD_ANY) != (gKeyStatusPtr->newKeys & DPAD_ANY)) {
                    return;
                }
            }
        }
    }

    if ((newCursor.x >= 0) && (newCursor.x < gBmMapSize.x)) {
        gBmSt.cursorTarget.x += sDirKeysToOffsetLut[dir][0] * 16;

        gBmSt.cursorPrevious.x = gBmSt.playerCursor.x;
        gBmSt.playerCursor.x = newCursor.x;
    }

    if ((newCursor.y >= 0) && (newCursor.y < gBmMapSize.y)) {
        gBmSt.cursorTarget.y += sDirKeysToOffsetLut[dir][1] * 16;

        gBmSt.cursorPrevious.y = gBmSt.playerCursor.y;
        gBmSt.playerCursor.y = newCursor.y;
    }

    if (!(gBmSt.gameStateBits & (1 << 2))) {
        if (gBmSt.playerCursor.x == gBmSt.cursorPrevious.x && gBmSt.playerCursor.y == gBmSt.cursorPrevious.y) {
            return;
        }

        PlaySoundEffect(SONG_65);
        gBmSt.gameStateBits |= (1 << 2);
    } else {
        gBmSt.gameStateBits &= ~(1 << 2);
    }

    return;
}

//! FE8U = 0x08015838
void HandleMoveMapCursor(int step) {
    if (gBmSt.playerCursorDisplay.x < gBmSt.cursorTarget.x) {
        gBmSt.playerCursorDisplay.x += step;
    }

    if (gBmSt.playerCursorDisplay.x > gBmSt.cursorTarget.x)
    {
        gBmSt.playerCursorDisplay.x -= step;
    }

    if (gBmSt.playerCursorDisplay.y < gBmSt.cursorTarget.y) {
        gBmSt.playerCursorDisplay.y += step;
    }

    if (gBmSt.playerCursorDisplay.y > gBmSt.cursorTarget.y) {
        gBmSt.playerCursorDisplay.y -= step;
    }

    return;
}

//! FE8U = 0x0801588C
void HandleMoveCameraWithMapCursor(int step) {

    s8 isUpdated = 0;

    int xCursorSprite = gBmSt.playerCursorDisplay.x;
    int yCursorSprite = gBmSt.playerCursorDisplay.y;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > xCursorSprite) {
        if (xCursorSprite - CAMERA_MARGIN_LEFT < 0) {
            gBmSt.camera.x = 0;
        } else {
            isUpdated = 1;

            gBmSt.camera.x -= step;
            gBmSt.unk36 = -step;

            gBmSt.unk32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < xCursorSprite) {
        if (xCursorSprite - CAMERA_MARGIN_RIGHT > gBmSt.cameraMax.x) {
            gBmSt.camera.x = gBmSt.cameraMax.x;
        } else {
            isUpdated = 1;

            gBmSt.camera.x += step;
            gBmSt.unk36 = step;

            gBmSt.unk32 = gBmSt.camera.x & 0xf;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > yCursorSprite) {
        if (yCursorSprite - CAMERA_MARGIN_TOP < 0) {
            gBmSt.camera.y = 0;
        } else {
            isUpdated = 1;
            gBmSt.camera.y -= step;
            gBmSt.unk37 = -step;

            gBmSt.unk34 = gBmSt.camera.y & 0xf;
        }
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < yCursorSprite) {
        if (yCursorSprite - CAMERA_MARGIN_BOTTOM > gBmSt.cameraMax.y) {
            gBmSt.camera.y = gBmSt.cameraMax.y;
        } else {
            isUpdated = 1;

            gBmSt.camera.y += step;
            gBmSt.unk37 = step;

            gBmSt.unk34 = gBmSt.camera.y & 0xf;
        }
    }

    if (!isUpdated) {
        if (gBmSt.unk32 != 0) {
            gBmSt.unk32 = (gBmSt.unk32 + gBmSt.unk36) & 0xf;
            gBmSt.camera.x += gBmSt.unk36;
        }

        if (gBmSt.unk34 != 0) {
            gBmSt.unk34 = (gBmSt.unk34 + gBmSt.unk37) & 0xf;
            gBmSt.camera.y += gBmSt.unk37;
        }
    }

    return;
}

//! FE8U = 0x080159B8
u16 GetCameraAdjustedX(int x) {
    int result = gBmSt.camera.x;

    if (gBmSt.camera.x + CAMERA_MARGIN_LEFT > x) {
        result = x - CAMERA_MARGIN_LEFT < 0
            ? 0
            : x - CAMERA_MARGIN_LEFT;
    }

    if (gBmSt.camera.x + CAMERA_MARGIN_RIGHT < x) {
        result = x - CAMERA_MARGIN_RIGHT > gBmSt.cameraMax.x
            ? gBmSt.cameraMax.x
            : x - CAMERA_MARGIN_RIGHT;
    }

    return result;
}

//! FE8U = 0x080159FC
u16 GetCameraAdjustedY(int y) {
    int result = gBmSt.camera.y;

    if (gBmSt.camera.y + CAMERA_MARGIN_TOP > y) {
        result = y - CAMERA_MARGIN_TOP < 0
            ? 0
            : y - CAMERA_MARGIN_TOP;
    }

    if (gBmSt.camera.y + CAMERA_MARGIN_BOTTOM < y) {
        result = y - CAMERA_MARGIN_BOTTOM > gBmSt.cameraMax.y
            ? gBmSt.cameraMax.y
            : y - CAMERA_MARGIN_BOTTOM;
    }

    return result;
}

//! FE8U = 0x08015A40
u16 GetCameraCenteredX(int x) {

    int result = x - DISPLAY_WIDTH / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gBmSt.cameraMax.x) {
        result = gBmSt.cameraMax.x;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A6C
u16 GetCameraCenteredY(int y) {

    int result  = y - DISPLAY_HEIGHT / 2;

    if (result < 0) {
        result = 0;
    }

    if (result > gBmSt.cameraMax.y) {
        result = gBmSt.cameraMax.y;
    }

    return result &~ 0xF;
}

//! FE8U = 0x08015A98
void PutMapCursor(int x, int y, int kind) {

    int oam2 = 0;

    u16* sprite = NULL;

    int frame = (GetGameClock() / 2) % 16;

    switch (kind) {
        case 0:
        case 1:
            oam2 = 2;
            sprite = sMapCursorSpriteLut[frame];

            break;

        case 2:
            if (GetGameClock() - 1 == sLastTimeMapCursorDrawn) {
                x = (x + sLastCoordMapCursorDrawn.x) >> 1;
                y = (y + sLastCoordMapCursorDrawn.y) >> 1;
            }

            oam2 = 0x24;

            sprite = sMapCursorSpriteLut[frame];

            sLastCoordMapCursorDrawn.x = x;
            sLastCoordMapCursorDrawn.y = y;

            sLastTimeMapCursorDrawn = GetGameClock();

            break;

        case 3:
            oam2 = 2;
            sprite = sSprite_MapCursorStretched;

            break;

        case 4:
            oam2 = 0x24;
            sprite = sMapCursorSpriteLut[0];

            break;
    }

    x = x - gBmSt.camera.x;
    y = y - gBmSt.camera.y;

    PutSprite(4, x, y, sprite, oam2);

    return;
}

//! FE8U = 0x08015B88
void DisplayBmTextShadow(int x, int y)
{
    int frame = (GetGameClock() / 2) % 16;
    u32 oam2 = 2;

    PutSprite(4, x, y, sMapCursorSpriteLut[frame], oam2);
    return;
}

//! FE8U = 0x08015BBC
void SetCursorMapPosition(int x, int y) {

    gBmSt.playerCursor.x = x;
    gBmSt.playerCursor.y = y;

    gBmSt.cursorTarget.x = x * 16;
    gBmSt.cursorTarget.y = y * 16;

    gBmSt.playerCursorDisplay.x = x * 16;
    gBmSt.playerCursorDisplay.y = y * 16;

    return;
}
