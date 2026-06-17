#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"




void MapAnim_Init_0(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_FD, proc->xDisplay);

    InitScanline();
    SetupMapAnimScanlineWindow();
    SetPrimaryHBlankHandler(HBlank_MapAnimEffect_Unk_0);
    SetDefaultMapAnimScreenConf();
    SetBlendAlpha(0x10, 0x10);

    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x140, BGPAL_MANIM_4));
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartMapAnimEffect_Unk_1(2, 0, 1, proc);
    Proc_Start(ProcScr_ManimShiftingSineWaveScanlineBuf, proc);

    proc->unk48 = 0;
    proc->frame_idx = 0;
}
