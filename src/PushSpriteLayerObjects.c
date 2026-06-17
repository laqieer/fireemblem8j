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
extern struct SpriteEntry sSpriteLayers[0x10];

void PushSpriteLayerObjects(int layer)
{
    struct SpriteEntry* it = sSpriteLayers + layer;

    while (it)
    {
        if (it->object)
            CallARM_PushToSecondaryOAM(it->oam1, it->oam0, it->object, it->oam2);

        it = it->next;
    }
}
