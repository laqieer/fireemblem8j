/*
 * NEAR-MISS reconstruction (sub_80CDCCC, JP 0x080CDCCC, 504B). diff = 12 bytes (reloc-excluded).
 * The JP-vs-fe8u difference (the +84 bytes) is a NON-EMPTY `case 1` (empty in fe8u): it decompresses
 * a BG tile (Img 0x08B53254 @ GetBackgroundTileDataOffset(3)+0x06002000) + an image (0x08B546D8 ->
 * gBG3TilemapBuffer), runs `buf[i] += 0xE100` over 640 u16 (TILEREF base adjust), then
 * BG_EnableSyncByMask(BG3_SYNC_BIT). Decoded via IDA Hex-Rays (mcp__ida__decompile @ 0x80CDCCC).
 * The logic + reg-alloc (reuse function-scope `i` as the loop counter) are byte-exact; the residual
 * 12 bytes (0xd6-0xe1) are an agbcc LOOP-INVARIANT-HOIST ORDER dead-end: JP materializes 0xE100
 * (r2) BEFORE the counter(r4=640); agbcc here emits it AFTER. ~11 C forms + permuter (base 245,
 * no convergence) could not flip the LICM placement -> NOT byte-matchable from valid C (the agbcc
 * ceiling, D96). If a future agbcc-order technique is found this carves in ~5 min: copy back to
 * src/, wire layout/carved_rom.d/handdecomp_sub_80CDCCC.tsv (0CDCCC 0CDEC4), git rm asm.
 */
#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C8D30
void OpAnimFaceMontageBegin(struct ProcOpAnim * proc)
{
    int ret;
    int i;

    i = DivRem(proc->unk3E, 0x4c);
    i = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, i, 0x4c);

    if (i < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, i, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - i, 0x10, 8);
    }

    proc->unk3E++;

    CopyToPalOpAnim(pal_OpanimGfx_0, 0, 0x100);

    ret = Interpolate(INTERPOLATE_LINEAR, 0xc, 0, proc->timer, 0x26);

    for (i = 0; i < 8; i++)
    {
        BlendPaletteToColor(gPaletteBuffer + i * 0x10, 0, ret);
    }

    switch (proc->timer)
    {
        case 1:
            Decompress((const void *)0x08B53254, (void *)(GetBackgroundTileDataOffset(3) + 0x06002000));
            Decompress((const void *)0x08B546D8, gBG3TilemapBuffer);

            {
                u16 * dst = gBG3TilemapBuffer;

                for (i = 640; i != 0; i--)
                    *dst++ += 0xE100;
            }

            BG_EnableSyncByMask(BG3_SYNC_BIT);

            break;

        case 2:
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x220, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x260, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x2a0, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x2e0, 0x20);

            break;

        case 3:
            Decompress(Img_OpAnimFaceRennac, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceRennac, 0x200, 0x20);
            Decompress(Img_OpAnimFaceRennacShadow, (void *)0x06010F00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceLArachel, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceLArachel, 0x240, 0x20);
            Decompress(Img_OpAnimFaceLArachelShadow, (void *)0x06012D00);

            break;

        case 5:
            Decompress(Img_OpAnimFaceDozla, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceDozla, 0x280, 0x20);
            Decompress(Img_OpAnimFaceDozlaShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 0x26)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
