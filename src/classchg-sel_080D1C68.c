#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/* file-scope type definitions used by this run */


struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

/* prototypes for same-file helpers called by this run */
void ChangeClassDescription(u32 msg);

void ClassChgSel_InitDescAndBg(struct ProcPromoSel *proc) {
    u16 tmp;

    ResetTextFont();
    ResetText();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    InitTalk(0x100, 2, 0);
    ChangeClassDescription(proc->msg_desc[proc->main_select]);
    SetTalkPrintDelay(-1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    tmp = REG_BG0CNT;
    tmp &= 0xFFFC;
    REG_BG0CNT = tmp + 1;
    tmp = REG_BG1CNT;
    tmp &= 0xFFFC;
    REG_BG1CNT = tmp + 1;
    tmp = REG_BG2CNT;
    tmp &= 0xFFFC;
    REG_BG2CNT = tmp + 1;
    tmp = REG_BG3CNT;
    tmp &= 0xFFFC;
    REG_BG3CNT = tmp + 1;
}
