#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"

#include "worldmap.h"

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

struct Unknown8A3E448
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};



// clang-format off









// clang-format on

extern u16 gUnk_16[];
extern u16 gUnk_17[];
extern u16 gUnk_18[];
extern u16 gUnk_19[];
extern u16 gUnk_20[];
extern u16 gUnk_21[];
extern u16 gUnk_22[];
extern u16 gUnk_24[];
extern u16 gUnk_25[];

// forward declarations
void RedrawGMapPIForNode(struct GMapPIProc *, int);

extern u16 gWorldmapMinimap_8[];
extern u16 gWorldmapMinimap_9[];
extern u16 gWorldmapMinimap_10[];
extern u16 gWorldmapMinimap_11[];

/* prototypes for same-file helpers called by this run */
void PutGMapPINodeName(struct GMapPIProc * proc, int nodeId);
void PutGMapPICharName(struct GMapPIProc * proc, int pid);
void PutGMapPIClassName(struct GMapPIProc * proc, int jid);
void PutGMapPIShopIcons(struct GMapPIProc * param_1, int param_2);
void DrawGMapPIPanelContents(struct GMapPIProc * proc);
void InitGMapPIInterfaceKind(struct GMapPIProc * proc, int nodeId);

//! FE8U = 0x080BEF20
void RedrawGMapPIForNode(struct GMapPIProc * proc, int nodeId)
{
    InitGMapPIInterfaceKind(proc, nodeId);

    DrawGMapPIPanelContents(proc);

    PutGMapPINodeName(proc, nodeId);

    if (proc->pid != 0)
    {
        PutGMapPICharName(proc, proc->pid);
    }
    else if (proc->jid != 0)
    {
        PutGMapPIClassName(proc, proc->jid);
    }

    PutGMapPIShopIcons(proc, nodeId);

    return;
}
