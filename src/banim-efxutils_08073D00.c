#include "global.h"

#include "anime.h"
#include "ekrbattle.h"

void BanimUpdateSpriteRotScale(void * src, struct AnimSpriteData * out, s16 x, s16 y, int unused)
{
    struct ObjAffineSrcData affin_src;
    struct AnimSpriteData * anim_sprite, * it;
    struct AnimSpriteData * scr = src;

    affin_src.rotation = 0;
    affin_src.xScale = x;
    affin_src.yScale = y;

    out[0].header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[0].as.affine, 1, 2);

    anim_sprite = &out[1];
    out[1].header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[1].as.affine, 1, 2);
    anim_sprite->as.affine.pa = -anim_sprite->as.affine.pa;
    anim_sprite->as.affine.pb = -anim_sprite->as.affine.pb;

    anim_sprite = &out[2];
    anim_sprite->header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[2].as.affine, 1, 2);
    anim_sprite->as.affine.pc = -anim_sprite->as.affine.pc;
    anim_sprite->as.affine.pd = -anim_sprite->as.affine.pd;

    anim_sprite = &out[3];
    anim_sprite->header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[3].as.affine, 1, 2);
    anim_sprite->as.affine.pa = -anim_sprite->as.affine.pa;
    anim_sprite->as.affine.pb = -anim_sprite->as.affine.pb;
    anim_sprite->as.affine.pc = -anim_sprite->as.affine.pc;
    anim_sprite->as.affine.pd = -anim_sprite->as.affine.pd;

    out = out + 4;

    for (; scr->header != 1; out++, scr++)
    {
        s16 r8, r5;
        int val1, val2, val, _val, header;

        r8 = x;
        r5 = y;

        header = scr->header;
        val = ((int)(-(header & 0x10000000)) >> 0x1F) & 0x2000000;

        if (header & 0x20000000)
            val = val + 0x4000000;

        out->header = (header &~ 0x3E000000) + 0x100 + val;
        out->as.object.oam2 = scr->as.object.oam2;

        val1 = GetAnimSpriteRotScaleX(header);
        val1 = val1 << 0x10;
        val1 = val1 >> 0x11;
        _val = val1 << 8;
        _val = val1 - Div(_val, r8);
        val1 = scr->as.object.x - _val;
        _val = scr->as.object.x << 8;
        _val = Div(_val, r8);
        _val = scr->as.object.x - _val;
        val1 = val1 - _val;
        out->as.object.x = val1;

        val1 = GetAnimSpriteRotScaleY(scr->header);
        val1 = val1 << 0x10;
        val1 = val1 >> 0x11;
        _val = val1 << 8;
        _val = val1 - Div(_val, r5);
        val1 = scr->as.object.y - _val;
        _val = scr->as.object.y << 8;
        _val = Div(_val, r5);
        _val = scr->as.object.y - _val;
        val1 = val1 - _val;
        out->as.object.y = val1;
    }
    out->header = scr->header;
    out->as.object.oam2 = scr->as.object.oam2;
    out->as.object.x = scr->as.object.x;
    out->as.object.y = scr->as.object.y;
}
