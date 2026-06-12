#include "global.h"

#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"

#include "worldmap.h"

#include "constants/songs.h"

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 * Events_WM_Beginning[];
extern u16 * Events_WM_ChapterIntro[];

struct Proc8A3DD30
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD38
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD08
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;

    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
};

/* prototypes for same-file helpers called by this run */
s8 WorldMap_IsMonsterAtUnclearedNode(int location);

//! FE8U = 0x080B8BA4
void WorldMap_MuWalkLoop(struct WorldMapMainProc * proc)
{
    struct UnknownSub80BDEB4 a;

    if (GmMu_IsMoving(proc->gm_mu, 0) != 0)
    {
        return;
    }

    if (proc->unk_40 < GetGmPathLength() - 1)
    {
#ifdef NONMATCHING
        int var = GetGmPathLength() - proc->unk_40;
#else
        register int var asm("r0") = GetGmPathLength() - proc->unk_40;
#endif
        if (var == 2)
        {
            int location = GetGmPathNode(proc->unk_40 + 1);
            if (gGMData.nodes[location].state & 2 &&
                GetGmPathNode(proc->unk_40 + 1)[gWMNodeData].placementFlag != GMAP_NODE_PLACEMENT_DUNGEON)
            {
                proc->unk_3e = GetGmPathNode(proc->unk_40 + 1);
                Proc_Goto(proc, 14);
            }
        }
        else
        {
            if (GetGmSkirmishUnitAtNode(GetGmPathNode(proc->unk_40 + 1)) >= 0)
            {
                Proc_Goto(proc, 17);
                return;
            }
        }

        if (proc->unk_41 < 1)
        {
            int b = GetGmPathNode(proc->unk_40);
            int c = GetGmPathNode(proc->unk_40 + 1);
            GmMu_0(proc->gm_mu, 0, 1);

            a.unk_00 = 0;
            a.unk_06 = b;
            a.unk_08 = c;
            a.unk_0c = -1;
            a.unk_01 = proc->flags_1;
            a.unk_0a = 0;
            a.unk_02 = 1;
            a.unk_03 = 0xff;
            a.unk_04 = 4;

            GmMu_StartMoveBetweenNodes(proc->gm_mu, &a);
            proc->unk_41 = 8;
            proc->unk_40++;
        }
        else
        {
            if (proc->flags_1)
            {
                if (gKeyStatusPtr->heldKeys & A_BUTTON)
                {
                    proc->unk_41 -= 2;
                }
            }
            proc->unk_41--;
        }
    }
    else
    {
        int location;

        proc->flags_1 = 0;
        gGMData.units[0].location = GetGmPathNode(proc->unk_40);
        GmMu_0(proc->gm_mu, 0, 0);

        location = gGMData.units[0].location;
        if (location[gWMNodeData].placementFlag == GMAP_NODE_PLACEMENT_DUNGEON)
        {
            Proc_Goto(proc, 14);
        }
        else
        {
            if (WorldMap_IsMonsterAtUnclearedNode(location) != 0)
            {
                Proc_Goto(proc, 16);
            }
            else
            {
                gGMData.sprite_disp = 1;
                Proc_Break(proc);
            }
        }
    }
    return;
}
