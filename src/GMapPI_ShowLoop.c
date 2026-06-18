#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "worldmap.h"

extern int DrawGMapPIPanelAtHeight();
extern s8 gGMapPIShowOffsetTableA[3];
extern s8 gGMapPIShowOffsetTableB[3];

struct GMapPIProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x3C);
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

void GMapPI_ShowLoop(struct GMapPIProc * proc)
{
    int height;
    int maxCnt;

    switch (proc->interfaceKind)
    {
        case 0:
            height = gGMapPIShowOffsetTableA[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIShowOffsetTableA);
            break;

        case 1:
            height = gGMapPIShowOffsetTableB[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIShowOffsetTableB);
            break;
    }

    DrawGMapPIPanelAtHeight(proc->unk_50, height, proc->interfaceKind);

    proc->showHideCnt++;

    if (proc->showHideCnt == maxCnt)
    {
        proc->showHideCnt = 0;
        proc->unk_55 = 0;

        Proc_Break(proc);
    }

    return;
}
