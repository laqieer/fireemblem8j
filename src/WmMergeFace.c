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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldmapMain_0[];

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

// clang-format on

//! FE8U = 0x080BA0B4
void WmMergeFace(int timerMaybe, u8 b, int faceSlot, int fid, int e, int f, int config)
{
    struct WorldMapMainProc * parent = Proc_Find(ProcScr_WorldMapMain);

    struct Proc8A3DD08 * proc = Proc_Start(ProcScr_WorldmapMain_0, parent);
    proc->unk_2c = timerMaybe; // timer?
    proc->unk_30 = b;
    proc->unk_34 = faceSlot; // face slot
    proc->unk_40 = fid;      // fid
    proc->unk_38 = e;
    proc->unk_3c = f;
    proc->unk_44 = config; // face config

    return;
}
