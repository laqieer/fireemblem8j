

#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "worldmap.h"

//! FE8U = 0x080C36E8
void WmMinimap_PutCursorIcon(struct GMapRadarProc * proc)
{
    int xTmp;
    int yTmp;
    int xOam1;
    int yOam0;

    int x = gGMData.ix >> 8;
    int y = gGMData.iy >> 8;

    xTmp = proc->unk_2f * 8 + ((x * 0x3f) / 0x1e0);
    yTmp = proc->unk_30 * 8 + ((y * 0x2b) / 0x140);

    xOam1 = xTmp - 1;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1f) && (xTmp < 0x111) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF6) + OAM2_PAL(4));
    }

    return;
}

//! FE8U = 0x080C3770
void WmMinimap_PutStoryNodeIcon(struct GMapRadarProc * proc)
{
    int x;
    int y;
    int xTmp;
    int yTmp;
    int xOam1;
    int yOam0;

    int nodeId = GetNextUnclearedNode(&gGMData);

    if (nodeId < 0)
    {
        return;
    }

    x = nodeId[gWMNodeData].x;
    y = nodeId[gWMNodeData].y;

    xTmp = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
    yTmp = proc->unk_30 * 8 + ((y * 0x2b) / 0x140);

    xOam1 = xTmp - 1;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1f) && (xTmp < 0x111) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF7) + OAM2_PAL(4));
    }

    return;
}

//! FE8U = 0x080C380C
void WmMinimap_PutLordIcon(struct GMapRadarProc * proc)
{
    int xTmp;
    int yTmp;
    int x;
    int y;
    int xOam1;
    int yOam0;
    s16 xPos;
    s16 yPos;

    if (!(gGMData.units[0].state & 1))
    {
        return;
    }

    GmMu_GetPosition(GM_MU, 0, &xPos, &yPos);

    x = *&xPos;
    y = *&yPos;

    xTmp = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
    yTmp = proc->unk_30 * 8 + (y * 0x2b / 0x140);

    xOam1 = xTmp - 3;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1d) && (xTmp < 0x113) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF4) + OAM2_PAL(9));
    }

    return;
}

//! FE8U = 0x080C38BC
void WmMinimap_PutSkirmishIcons(struct GMapRadarProc * proc)
{
    int i;
    int j;
    int r9;
    s16 sl;
    struct Vec2 coords[3];
    s16 sp_1c;

    int r8 = 0;
    int sp_18 = 0;

    for (r9 = 4; r9 < 7; r9++)
    {
        int x;
        int y;
        int x2;
        int y2;

        if (!(gGMData.units[r9].state & 1))
        {
            continue;
        }

        GmMu_GetPosition(GM_MU, r9, &sp_1c, &sl);

        x = sp_1c;
        y = sl;

        x2 = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
        y2 = proc->unk_30 * 8 + (y * 0x2b / 0x140);

        coords[r8].x = x2 - 3;
        coords[r8].y = y2 + 7;
        r8++;
        sp_18++;
    }

    for (i = 0; i < sp_18 - 1; i++)
    {
        for (j = i + 1; j < sp_18; j++)
        {
            if (coords[j].y < coords[i].y)
            {
                struct Vec2 coord;
                coord.x = coords[i].x;
                coord.y = coords[i].y;

                coords[i].x = coords[j].x;
                coords[i].y = coords[j].y;

                coords[j].x = coord.x;
                coords[j].y = coord.y;
            }
        }
    }

    for (i = 0; i < sp_18; i++)
    {
        if ((coords[i].x >= -0x20) && (coords[i].x < 0x110) && (coords[i].y >= -0x20) && (coords[i].y < 0xc0))
        {
            PutSpriteExt(0, OAM1_X(coords[i].x), OAM0_Y(coords[i].y), gObject_8x8, OAM2_CHR(0xF5) + OAM2_PAL(9));
        }
    }

    return;
}
