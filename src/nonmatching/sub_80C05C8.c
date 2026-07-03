/* NON_MATCHING: byte source is asm/sub_80C05C8.s @ JP 0x080C05C8 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * PROPOSED NAME: GmapScreen2_Loop  (worldmap-screen node-icon display proc _Loop).
 * Twin in fe8u: src/worldmap_screen2.c GmapScreen2_Loop @ US 0x080BB798 — that
 * function MATCHES in the US ROM with THIS EXACT body. Every load/store offset,
 * immediate and struct access matches the JP target instruction-for-instruction.
 * Callee sub_80C0574 is the already-carved sibling GmapScreen2_GetNodeScreenPos.
 *
 * STATUS: CLEAN register-coloring NEAR. Structure is byte-exact; the residual is a
 * pure agbcc spill/coloring divergence (docs/agbcc_codegen_levers.md §7-9 class).
 *
 * EXACT BLOCKING DIFF (this build -> JP), the whole residual:
 *   (a) uniform +1 callee-saved shift, with one eviction to stack:
 *         i (loop idx)      r7        ->  r8
 *         proc  (param)     r8        ->  r9  (sb)
 *         &local_2c ptr     r9        ->  sl  (r10)
 *         chr               sl (r10)  ->  SPILLED to [sp,#0xc]
 *         stack frame       sub sp,#0x10  ->  sub sp,#0x14
 *   (b) ROOT CAUSE of (a): per-node arg setup for GmapScreen2_GetNodeScreenPos.
 *       JP sign-extends x1 = (s16)(node->x - icon->xCenter) and y1 FULLY and EARLY
 *       (`lsls #16; asrs r7,#16`) into callee-saved r7/r6 BEFORE the
 *       proc->pScreenProc load, then stages them `adds r1,r7,#0; adds r2,r6,#0`.
 *       agbcc here keeps x1/y1 raw in the volatile arg regs r1/r2 and DEFERS the
 *       sign-extension until after the proc load. Because x1/y1 DIE at the call,
 *       agbcc has no live-range reason to park them in callee-saved r7/r6, so it
 *       leaves them volatile — freeing r6/r7 and letting i/proc/&local_2c stay one
 *       register lower, which un-evicts chr. Pin HINTS on x1/y1 are overridden
 *       (die-at-call temps). This is (b)->(a): the coloring cascade is entirely
 *       downstream of where the two die-at-call temps get placed.
 *
 * PROOF THIS IS A JP-SPECIFIC agbcc COIN-FLIP, not a source error:
 *   fe8u's CHECKED-IN src/worldmap_screen2.s for GmapScreen2_Loop emits EXACTLY
 *   THIS build's coloring (`add sp,sp,#-0x10; mov r8,r0; mov sl,r0`; i=r7, no chr
 *   spill) — and the US ROM MATCHES. So the identical C compiles to MY coloring on
 *   the US axis and to a DIFFERENT coloring on the JP axis: a genuine agbcc
 *   version/allocation divergence, not a reconstruction defect.
 *
 * LEVERS TRIED (oracle = raw-binary asm-differ of 0x080C05C8..0x080C07E8; none -> 0):
 *   - CC1 flags: -mjp-promote, -fno-gcse (over-corrects), -fno-caller-saves,
 *     -fno-schedule-insns[2], -fno-strength-reduce, -fno-force-mem, -O1, old_agbcc:
 *     none reach the JP coloring; several regress.
 *   - register pins: `register int i asm("r8")` lands sub sp,#0x14 + chr spill + i->r8
 *     (closest, ~70 edits) BUT proc->r7 not r9, &local_2c->r9 not sl, and gcc then
 *     hoists gGMData into sl (JP reloads it) + adds a loop pre-check. Pinning proc->r9
 *     un-spills chr; pinning x1/y1->r7/r6 is ignored (die-at-call temps). No pin combo
 *     lands JP coloring without a side effect.
 *   - P2 mem-barrier `asm("":"+m"(chr))`: spills chr but stack does NOT grow — partial,
 *     no cascade. Kept below as `asm("":::"memory")` under #ifndef NONMATCHING (the
 *     single most-effective shaping lever, still short of 0).
 *   - source shapes: decl-order reorder, int+(s16) cast, intermediate ptr, inverted
 *     top-peel loop, volatile-field CSE defeat: all inert or worse.
 *   - decomp-permuter (agbcc cfg, TWO independent runs, ~9k+ iters each, -j4): base
 *     score 4265, random floor ~3325; every sub-base candidate is SEMANTICALLY INVALID
 *     (e.g. hoists `y1 = node->y - icon->yCenter` past PutSpriteExt -> stale y1). No
 *     valid 0-score source found.
 *
 * NEXT: community decomp.me pass — scratch R7AaX is queued for this function. On a
 * 0-score fork: move to src/GmapScreen2_Loop.c, flip carved_rom row to
 * src/GmapScreen2_Loop.o(.text), delete asm. `make compare` is the ONLY oracle.
 */
#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

/* Sibling GmapScreen2_GetNodeScreenPos (JP 0x080C0574) is carved to src/ but not
 * yet in the shared header; declare locally to keep worldmap.h untouched (same
 * style as src/GmapScreen2_GetNodeScreenPos.c which also omits the prototype). */
extern s8 GmapScreen2_GetNodeScreenPos(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut);

//! FE8U = 0x080BB798  (JP 0x080C05C8)
void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    int chr;
    int i;
    s16 local_2c;
    s16 local_2a;
    s16 local_28;
    s16 local_26;
    const struct GMapNodeData * node;
    const struct NodeIcon * icon;

    if (!proc->skip)
    {
        return;
    }

    chr = proc->chr / CHR_SIZE;

    for (i = 0; i < 0x1d; i++)
    {
        s16 x1, y1;
        if (!(gGMData.nodes[i].state & 1))
        {
            continue;
        }

        node = &i[gWMNodeData];

        icon = gWMNodeIconData + ((gGMData.nodes[i].state & 2) ? node->iconPreClear : node->iconPostClear);

        x1 = node->x - icon->xCenter;
        y1 = node->y - icon->yCenter;

        if (GmapScreen2_GetNodeScreenPos(proc->pScreenProc, x1, y1, &local_2c, &local_2a))
        {
            local_2c = OAM1_X(local_2c);
            local_2a = OAM0_Y(local_2a);

            if ((proc->unk_34[i / 0x20]) & (1 << (i & 0x1f)))
            {
                local_2a |= OAM0_BLEND;
            }

            PutSpriteExt(
                0xc,
                local_2c,
                local_2a,
                icon->pSpriteData,
                icon->sheetTileId + (chr) + OAM2_PAL(proc->pal) + OAM2_LAYER(2)
            );
        }
    }

    if (proc->merge_next_node)
    {
        node = &(proc->nodeId[gWMNodeData]);

        icon = gWMNodeIconData + ((gGMData.nodes[proc->nodeId].state & 2) ? node->iconPreClear : node->iconPostClear);

        *&local_28 = proc->pScreenProc->x;
        *&local_26 = proc->pScreenProc->y;

        local_2c = ((node->x - icon->xCenter) + icon->xFlagOrigin) - local_28;
        local_2a = ((node->y - icon->yCenter) + icon->yFlagOrigin) - local_26;

        if ((local_2a >= -0x20 && local_2a < 0xC0) && (local_2c >= -0x20 && local_2c < 0x110))
        {
            s16 xOam1;
            s16 yOam0;
#ifndef NONMATCHING
            asm("":::"memory");
#endif
            xOam1 = OAM1_X(local_2c);
            yOam0 = OAM0_Y(local_2a);

            if (((proc->unk_34[(proc->nodeId / 0x20)])) & (1 << (proc->nodeId & 0x1f)))
                yOam0 |= OAM0_BLEND;

            AP_Update(proc->ap, xOam1, yOam0);
        }
    }

    return;
}
