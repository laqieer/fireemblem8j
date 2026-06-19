#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"

static const u16 gUiutils_0[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x07, BGPAL_WINDOW_FRAME),
    TILEREF(0x08, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x06, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUiutils_1[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x66, BGPAL_WINDOW_FRAME),
    TILEREF(0x67, BGPAL_WINDOW_FRAME),
    TILEREF(0x67, BGPAL_WINDOW_FRAME),
    TILEREF(0x68, BGPAL_WINDOW_FRAME),

    TILEREF(0x06, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUiutils_2[] = {
    TILEREF(0x72, BGPAL_WINDOW_FRAME),
    TILEREF(0x73, BGPAL_WINDOW_FRAME),
    TILEREF(0x73, BGPAL_WINDOW_FRAME),
    TILEREF(0x74, BGPAL_WINDOW_FRAME),

    TILEREF(0x75, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x76, BGPAL_WINDOW_FRAME),

    TILEREF(0x75, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x76, BGPAL_WINDOW_FRAME),

    TILEREF(0x77, BGPAL_WINDOW_FRAME),
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x79, BGPAL_WINDOW_FRAME),
};

static const u16 gUiutils_3[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x0C, BGPAL_WINDOW_FRAME),
    TILEREF(0x0D, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0F, BGPAL_WINDOW_FRAME),

    TILEREF(0x0B, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0F, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUiutils_4[] = {
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x79, BGPAL_WINDOW_FRAME),
    TILEREF(0x7A, BGPAL_WINDOW_FRAME),
    TILEREF(0x7B, BGPAL_WINDOW_FRAME),
    TILEREF(0x7C, BGPAL_WINDOW_FRAME),
    TILEREF(0x7D, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x34, BGPAL_WINDOW_FRAME),
    TILEREF(0x7A, BGPAL_WINDOW_FRAME),
    TILEREF(0x7B, BGPAL_WINDOW_FRAME),
    TILEREF(0x7C, BGPAL_WINDOW_FRAME),
    TILEREF(0x63, BGPAL_WINDOW_FRAME) + 0x0400,
    TILEREF(0x63, BGPAL_WINDOW_FRAME),
    TILEREF(0x62, BGPAL_WINDOW_FRAME) + 0x0400,
    TILEREF(0x62, BGPAL_WINDOW_FRAME),
    TILEREF(0x60, BGPAL_WINDOW_FRAME),
    TILEREF(0x60, BGPAL_WINDOW_FRAME) + 0x0800,
    TILEREF(0x61, BGPAL_WINDOW_FRAME),
    TILEREF(0x61, BGPAL_WINDOW_FRAME) + 0x0800,
};

static const u16* sUiFrameModelTilemapLookup[] = {
    gUiutils_0,
    gUiutils_2,
    gUiutils_3,
    gUiutils_1,
};

static const u16* sLegacyUiFramePaletteLookup[] = {
    gLegacyUiFrameAPalette,
    gLegacyUiFrameBPalette,
    gLegacyUiFrameCPalette,
    gLegacyUiFrameDPalette,
};

const u16* sUiFramePaletteLookup[] = {
    gUiFramePaletteA,
    gUiFramePaletteB,
    gUiFramePaletteC,
    gUiFramePaletteD,
};

static const void* sLegacyUiFrameImageLookup[] = {
    gLegacyUiFrameAImage,
    gLegacyUiFrameBImage,
    gLegacyUiFrameCImage,
    gLegacyUiFrameDImage,
};

static const void* sUiFrameImageLookup[] = {
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
};

static const u16* sStatBarPaletteLookup[] = {
    gUiBarPaletteA,
    gUiBarPaletteB,
    gUiBarPaletteC,
    gUiBarPaletteD,
};

// TODO: OBJ DATA/SPRITE HELPER DEFINITIONS
static u16 sSprite_Hand[] = {
    1,
    0x0002, 0x4000, 0x0000
};

static u8 sHandHOffsetLookup[] = {
    0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1,
};

EWRAM_DATA
static struct Vec2 sPrevHandScreenPosition = {};

EWRAM_DATA
static int sPrevHandClockFrame = 0;

/* prototypes for same-file helpers called by this run */
void UnpackLegacyUiFramePalette(int palId);
void UnpackUiFramePalette(int palId);
void UnpackLegacyUiFrameImage(void* dest);
void UnpackUiFrameImage(void* dest);

void DisplayUiHand(int x, int y)
{
    if ((GetGameClock() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameClock();

    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayUiHand_unused(int x, int y)
{
    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayFrozenUiHand(int x, int y)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, 0);
}

int GetUiHandPrevDisplayX(void)
{
    return sPrevHandScreenPosition.x;
}

int GetUiHandPrevDisplayY(void)
{
    return sPrevHandScreenPosition.y;
}

void ClearBg0Bg1(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DrawUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    // TODO: meaningful constants

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_WINDOW_FRAME);

    for (x += 1; x < xMax; ++x)
        gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_WINDOW_FRAME);

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_WINDOW_FRAME);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void ClearUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    for (; x < xMax; x += 2)
    {
        gBG1TilemapBuffer[TILEMAP_INDEX(x + 0, y)] = gUiutils_4[6];
        gBG1TilemapBuffer[TILEMAP_INDEX(x + 1, y)] = gUiutils_4[7];
    }

    gBG1TilemapBuffer[TILEMAP_INDEX(xMax, y)] = (width % 2)
        ? gUiutils_4[6]
        : gUiutils_4[7];

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void DrawUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = BG_GetMapBuffer(bg);

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_WINDOW_FRAME) + base;

    for (x += 1; x < xMax; ++x)
        tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_WINDOW_FRAME) + base;

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_WINDOW_FRAME) + base;

    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void ClearUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = BG_GetMapBuffer(bg);

    for (; x < xMax; x += 2)
    {
        tilemap[TILEMAP_INDEX(x + 0, y)] = gUiutils_4[6] + base;
        tilemap[TILEMAP_INDEX(x + 1, y)] = gUiutils_4[7] + base;
    }

    tilemap[TILEMAP_INDEX(xMax, y)] = (width % 2)
        ? gUiutils_4[6] + base
        : gUiutils_4[7] + base;

    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void UnpackUnkUiFrame(void* vram, int palId, int palCount)
{
    Decompress(gUnkUiFrameImage, vram);
    ApplyPalettes(gUnkUiFramePalettes, palId, palCount);
}

void DisplayUiHandExt(int x, int y, unsigned objTileOffset)
{
    if ((GetGameClock() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameClock();

    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void DisplayFrozenUiHandExt(int x, int y, unsigned objTileOffset)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void LoadLegacyUiFrameGraphics(void)
{
    UnpackLegacyUiFrameImage(NULL);
    UnpackLegacyUiFramePalette(-1);
}

void LoadUiFrameGraphics(void)
{
    UnpackUiFrameImage(NULL);
    UnpackUiFramePalette(-1);
}
