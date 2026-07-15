#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

/*
 * Matched by decomp.me fork KxTCq from the R7AaX family. The decisive source
 * shapes are ABI-wide coordinate arguments, literalizing the phase-1 palette
 * mask at its only use, and reversing an equivalent node-array subscript to
 * select the target's commutative add encoding.
 */

/* Sibling GmapScreen2_GetNodeScreenPos (JP 0x080C0574) is carved to src/ but not
 * yet in the shared header; declare locally to keep worldmap.h untouched (same
 * style as src/GmapScreen2_GetNodeScreenPos.c which also omits the prototype). */
extern s8 GmapScreen2_GetNodeScreenPos(
    struct GmScreenProc * proc, int xIn, int yIn, s16 * xOut, s16 * yOut);

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
                ((chr + new_var->sheetTileId) + ((proc->pal & 0xF) << 12)) + (((2 & 0x3) << 9) << 1)
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
                if ((*(u8 *) phaseRole)[gm->nodes].state & 2)
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
