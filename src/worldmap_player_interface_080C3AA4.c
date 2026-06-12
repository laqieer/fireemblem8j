extern int DrawGMapPIPanelAtHeight();
extern int RedrawGMapPIForNode();
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"
/* TU-private aggregate type defs (file-local) */
struct Unknown8A3E448
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};
/* TU-private data externs bound at their JP addresses */
extern s8 gGMapPIShowOffsetTableA[];
extern s8 gGMapPIShowOffsetTableB[];
extern struct Unknown8A3E448 gWorldmapPlayerInterface_0[];

struct UnkParentProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x48);
    /* 48 */ void * unk_48;
};
struct GMapPIProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[2];
    /* 3C */ STRUCT_PAD(0x3C, 0x40);
    /* 40 */ u16 * unk_40;
    /* 44 */ u16 unk_44;
    /* 46 */ STRUCT_PAD(0x46, 0x4C);
    /* 4C */ s8 xPrev;
    /* 4D */ s8 yPrev;
    /* 4E */ s8 xNew;
    /* 4F */ s8 yNew;
    /* 50 */ s8 unk_50;
    /* 51 */ STRUCT_PAD(0x51, 0x54);
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ int showHideCnt;
    /* 5C */ u16 nodeId;
    /* 5E */ u8 interfaceKind;
    /* 5F */ u8 pid;
    /* 60 */ u8 jid;
};

void ClearGMapPIPanel(int index);

//! FE8U = 0x080BECB8
void GMapPI_TrackCursorLoop(struct GMapPIProc * proc)
{
    int nodeId;
    int height;
    int index;

    proc->xPrev = proc->xNew;
    proc->yPrev = proc->yNew;

    proc->xNew = gGMData.ix >> 8;
    proc->yNew = gGMData.iy >> 8;

    if (proc->xNew == proc->xPrev && proc->yNew == proc->yPrev)
        return;

    height = gGMData.iy >> 8;

    nodeId = GetNodeAtPosition(
        ((struct UnkParentProc *)(proc->proc_parent))->unk_48, gGMData.ix >> 8, gGMData.iy >> 8, 0, 0);

    if (nodeId < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->nodeId != nodeId)
    {
        ClearGMapPIPanel(proc->unk_50);
        RedrawGMapPIForNode(proc, nodeId);

        proc->unk_50 = GetWMCursorScreenQuadrant(0, 0, 0, 0);

        switch (proc->interfaceKind)
        {
            case 0:
                height = gGMapPIShowOffsetTableA[2];
                break;

            case 1:
                height = gGMapPIShowOffsetTableB[2];
                break;
        }

        DrawGMapPIPanelAtHeight(proc->unk_50, height, proc->interfaceKind);

        proc->nodeId = nodeId;
    }

    index = GetWMCursorScreenQuadrant(0, 0, 0, 0);

    if (index != proc->unk_50)
    {
        if ((gWorldmapPlayerInterface_0[index].unk_02 != gWorldmapPlayerInterface_0[proc->unk_50].unk_02) ||
            (gWorldmapPlayerInterface_0[index].unk_03 != gWorldmapPlayerInterface_0[proc->unk_50].unk_03))
        {
            Proc_Break(proc);
        }
    }

    return;
}
