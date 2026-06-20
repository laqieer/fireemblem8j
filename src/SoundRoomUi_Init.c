#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"

extern u8 gMenuSoundroom_0[];
extern u8 gMenuSoundroom_1[];
extern u8 gMenuSoundroom_3[];
extern struct ProcCmd gProcScr_VolumeGraphBuffer[];
void InitSoundRoomSongData(struct SoundRoomProc * proc);
void SoundRoom_PutHandCursor(struct SoundRoomProc * proc);
void SoundRoom_DrawSongList(struct SoundRoomProc * proc);
void SoundRoom_UpdateScrollBar(struct SoundRoomProc * proc);
void SoundRoom_DrawCompletionPercent(u16 * dest, struct SoundRoomProc * proc);
void TickCurrentSongTime(struct SoundRoomProc * proc);
ProcPtr StartMenuScrollBarExt(ProcPtr proc, int x, int y, int a, int b);
void InitSoundRoomVolumeGraph(void);


//! FE8U = 0x080AF524
void SoundRoomUi_Init(struct SoundRoomProc * proc)
{
    SetupBackgrounds(NULL);

    ResetTextFont();
    ResetText();

    LoadObjUIGfx();
    LoadUiFrameGraphics();
    InitSystemTextFont();

    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    RegisterBlankTile(0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->curIndex = 0;
    proc->unk_37 = 0;
    proc->bgYOffset = 0;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_3d = 0;
    proc->unk_3e = 0;
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;
    proc->currentSongIdx = -1;
    proc->unk_2e = 0;
    proc->currentSongTime = 0;
    proc->unk_3f = 0;

    InitSoundRoomSongData(proc);
    SoundRoom_InitText();
    TryDrawSoundRoomSongTitle(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x280, 2);
    SoundRoom_PutHandCursor(proc);
    SoundRoom_DrawSongList(proc);
    StartMenuScrollBarExt(proc, 216, 72, 0x1000, 3);
    SoundRoom_UpdateScrollBar(proc);

    Decompress(gMenuSoundroom_3, (void *)0x06004000);
    ApplyPalette(gUnkData_30, 4);
    ApplyPalette(gUnkData_31, 5);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 7), gMenuSoundroom_0, 0x1000);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), gMenuSoundroom_1, 0x1000);

    SoundRoom_DrawCompletionPercent(TILEMAP_LOCATED(gBG0TilemapBuffer, 16, 6), proc);

    Decompress(Img_PlayStatusSprites, (void *)0x06016000);
    ApplyPalette(Pal_PlayStatusSprites, 0x1C);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, -4, 0);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin0Box(4, 66, 240, 144);
    SetWOutLayers(1, 1, 0, 1, 1);

    Decompress((const void *)0x08AAAC4C, (void *)0x06012000);
    ApplyPalettes((const void *)0x08AAB440, 0x13, 3);

    DrawSoundRoomSprites(proc);

    SetBlendAlpha(15, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    StartMuralBackground(proc, NULL, 0xe);

    StartGreenText(proc);

    InitSoundRoomVolumeGraph();
    StartParallelWorker(TickCurrentSongTime, proc);
    Proc_Start(gProcScr_VolumeGraphBuffer, proc);

    return;
}
