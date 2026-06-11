#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

int GetProperAnimSoundLocation(struct Anim * anim)
{
    int i, header, val2, val1;
    u32 ret;
    const struct AnimSpriteData * anim_sprite, * it;

    anim_sprite = anim->pSpriteData;
    header = anim_sprite->header;

    if ((header & 0xFFFF0000) == 0xFFFF0000)
        for (val2 = (header & 0x0000FFFF); val2 != 0; val2--, anim_sprite++);

    it = anim_sprite;
    val2 = 0;
    val1 = 0;

    for (; it->header != 1; it++)
    {
        int a, b, c;
        
        a = it->as.object.x;
        a += (GetAnimSpriteRotScaleX(it->header) << 0x10) >> 0x11;
        b = GetAnimSpriteRotScaleX(it->header);
        c = GetAnimSpriteRotScaleY(it->header);

        val1 += ((s16)b) * ((s16)c) * a;
        val2 += ((s16)b) * ((s16)c);
    }

    if (val2 == 0)
        ret = 0x7FFFFFFF;
    else
        ret = Div(val1, val2);

    val1 = ret;

    asm("":::"memory");
    ret = val1;
    return val1;
}
