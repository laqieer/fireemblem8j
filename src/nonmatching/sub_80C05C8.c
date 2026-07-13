/* NON_MATCHING: byte source is asm/sub_80C05C8.s @ JP 0x080C05C8 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * PROPOSED NAME: GmapScreen2_Loop  (worldmap-screen node-icon display proc _Loop).
 * Twin in fe8u: src/worldmap_screen2.c GmapScreen2_Loop @ US 0x080BB798.
 *
 * Adopted from community decomp.me fork SaCCn by user TsilaAllaoui. This source
 * shape preserves default nonmatching CFLAGS and improves the match rate from the
 * old local reconstruction while remaining proved-equivalent to the JP byte source:
 *   prove_nonmatching.py sub_80C05C8 -> PROVEN-BOUNDED(2)
 *   differential_test.py sub_80C05C8 --trials 60 -> EQUIV
 *
 * 2026-07-13 allocator trace: a point-scoped, zero-byte clobber after the
 * phase-2 OAM coordinates are defined makes only those two pseudos conflict
 * with r4/r5. GCC 2.95 therefore assigns yOam0 to r6 and xOam1 to r7, matching
 * the AP_Update carriers without disturbing proc=r9, i=r8, or outX=sl.
 * decomp.me R7AaX: 1410 -> 1380.
 *
 * 2026-07-13 follow-up: `uintptr_t phaseRole` is one GCC user pseudo across
 * both phases (greg pseudo 24, 21 refs / live length 396) and therefore keeps
 * r8 when its role changes from loop index to `&proc->nodeId`. A short r3
 * nodeId-address scratch plus destination readback of `&gGMData` orders the
 * target boundary as `add r7,r2; mov r8,r3`; the r4/r5 clobber still preserves
 * the exact AP_Update r7/r6 carriers. decomp.me R7AaX: 1380 -> 1175.
 *
 * 2026-07-13 pressure follow-up: phase-1 indexes unk_34 directly with phaseRole,
 * while a real phase-role alias becomes the signed X carrier and X/Y are kept
 * live across the screen-position call by a zero-byte input. Together with the
 * point-scoped r7 and AP r4/r5 masks this removes the phase-1 sp+8 spill, keeps
 * both solved anchors, and reaches the target 544-byte size. R7AaX: 1175 -> 480.
 *
 * On a 0-score fork: move to src/GmapScreen2_Loop.c, flip carved_rom row to
 * src/GmapScreen2_Loop.o(.text), delete asm. `make compare` is the ONLY oracle.
 */
#ifndef FE8J_DECOMPME_CONTEXT
#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"
#endif

/* Sibling GmapScreen2_GetNodeScreenPos (JP 0x080C0574) is carved to src/ but not
 * yet in the shared header; declare locally to keep worldmap.h untouched (same
 * style as src/GmapScreen2_GetNodeScreenPos.c which also omits the prototype). */
extern s8 GmapScreen2_GetNodeScreenPos(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut);

//! FE8U = 0x080BB798  (JP 0x080C05C8)
void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    int chr;
    uintptr_t phaseRole;
    int phaseAlias;
    struct GmNodeIconDisplayProc * new_var2;
    s16 local_2c;
    const struct NodeIcon * new_var;
    int new_var4;
    s16 local_2a;
    s16 local_28;
    s16 local_26;
    struct GmNodeIconDisplayProc * new_var3;
    const struct GMapNodeData * node;
    const struct NodeIcon * icon;
    const u8 * nodeIdAddr;
    struct GMapData * gm;

    if (!proc->skip)
    {
        return;
    }

    chr = proc->chr / 0x20;

    for (phaseRole = 0; (int) phaseRole < 0x1D; phaseRole++)
    {
        s16 x1;
        int y1;

        phaseAlias = (int) phaseRole;
        asm("" ::: "r7");

        if (!(gGMData.nodes[(int) phaseRole].state & 1))
        {
            continue;
        }

        node = &phaseAlias[gWMNodeData];
        icon = gWMNodeIconData + ((gGMData.nodes[(int) phaseRole].state & 2) ? (node->iconPreClear) : (node->iconPostClear));

        new_var = icon;
        ;
        new_var4 = 0xF;
        ;
        phaseAlias = (s16) (node->x - new_var->xCenter);
        y1 = (s16) ((*node).y - new_var->yCenter);

        if (GmapScreen2_GetNodeScreenPos(proc->pScreenProc, phaseAlias, y1, &local_2c, &local_2a))
        {
            asm("" : : "r"(phaseAlias), "r"(y1));
            local_2c = local_2c & 0x01FF;
            local_2a = local_2a & 0x00FF;

            if (proc->unk_34[(int) phaseRole / 0x20] & (1 << ((int) phaseRole & 0x1F)))
            {
                local_2a |= 0x0400;
            }

            PutSpriteExt(
                0xC,
                local_2c,
                local_2a,
                new_var->pSpriteData,
                ((chr + new_var->sheetTileId) + ((proc->pal & new_var4) << 12)) + (((2 & 0x3) << 9) << 1)
            );
        }
    }

    if (proc->merge_next_node)
    {
        nodeIdAddr = &proc->nodeId;
        node = &(*nodeIdAddr)[gWMNodeData];
        new_var4 = gGMData.nodes[*nodeIdAddr].state & 2;
        gm = &gGMData;
        phaseRole = (uintptr_t) nodeIdAddr;
        icon = gWMNodeIconData + (new_var4 ? (node->iconPreClear) : (node->iconPostClear));

        *(&local_28) = proc->pScreenProc->x;
        *(&local_26) = proc->pScreenProc->y;

        local_2c = ((node->x - icon->xCenter) + icon->xFlagOrigin) - local_28;
        local_2a = ((node->y - icon->yCenter) + icon->yFlagOrigin) - local_26;

        if (((local_2a >= (-0x20)) && (local_2a < 0xC0)) && ((local_2c > ((-0x20) - 1)) && (local_2c <= (0x110 - 1))))
        {
            s16 xOam1;
            unsigned short yOam0;

            do
            {
                gm->nodes[*(u8 *) phaseRole].state += 0;
                if (gm->nodes[*(u8 *) phaseRole].state & 2)
                {
                    xOam1 = local_2c & 0x01FF;
                }
                else
                {
                    xOam1 = local_2c;
                    xOam1 = xOam1 & 0x01FF;
                }
            } while (0);

            xOam1 = local_2c & 0x01FF;
            yOam0 = local_2a & 0x00FF;
            asm("" ::: "r4", "r5");
            new_var2 = proc;

            if (new_var2->unk_34[*(u8 *) phaseRole / 0x20] & (1 << (*(u8 *) phaseRole & 0x1F)))
            {
                yOam0 |= 0x0400;
            }

            new_var3 = new_var2;
            yOam0++;

            do
            {
                yOam0--;
            } while (0);

            AP_Update(new_var3->ap, xOam1, yOam0);
        }
    }

    return;
}
