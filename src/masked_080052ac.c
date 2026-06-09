#include "global.h"
#include "proc.h"
#include "ctc.h"

struct SpriteEntry
{
    /* 00 */ struct SpriteEntry* next;
    /* 04 */ s16 oam1;
    /* 06 */ s16 oam0;
    /* 08 */ u16 oam2;
    /* 0A */ // pad
    /* 0C */ const u16* object;
};

struct SpriteProc
{
    PROC_HEADER;

    /* 2C */ u32 x;
    /* 30 */ u32 y;
    /* 34 */ u8 pad34[0x50 - 0x34];
    /* 50 */ s16 layer;
    /* 52 */ u16 tileref;
    /* 54 */ const u16 * object;
};

 void SpriteRefresher_OnIdle(struct SpriteProc* proc);









































extern struct SpriteEntry* gSpriteAllocIt;

static struct SpriteEntry EWRAM_DATA sSpritePool[0x80] = {};
static struct SpriteEntry EWRAM_DATA sSpriteLayers[0x10] = {};

void ClearSprites(void)
{
    int i;

    for (i = 15; i >= 0; i--)
    {
        sSpriteLayers[i].next = &sSpriteLayers[i + 1];
        sSpriteLayers[i].object = NULL;
    }

    sSpriteLayers[15].next = NULL;
    sSpriteLayers[12].next = NULL;

    gSpriteAllocIt = sSpritePool;
}

void PutSprite(int layer, int x, int y, const u16* object, int oam2)
{
    gSpriteAllocIt->next = sSpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = x & 0x1FF;
    gSpriteAllocIt->oam0 = y & 0xFF;
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    sSpriteLayers[layer].next = gSpriteAllocIt++;
}

void PutSpriteExt(int layer, int xOam1, int yOam0, const u16* object, int oam2)
{
    gSpriteAllocIt->next = sSpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = xOam1;
    gSpriteAllocIt->oam0 = yOam0;
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    sSpriteLayers[layer].next = gSpriteAllocIt++;
}
