#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);

void EkrLvup_ResetScreen(struct ProcEkrLevelup *proc)
{
    struct BanimUnkStructComm *buf, _buf;
    buf = &gEkrlvup_1;

    if (GetBattleAnimArenaFlag() == false)
        EndBanimTerrain(buf);

    SetBackgroundMapDataOffset(0, 0x6000);
    SetBackgroundMapDataOffset(1, 0x6800);
    SetBackgroundMapDataOffset(2, 0x7000);

    SetBackgroundScreenSize(1, 0);
    SetBackgroundScreenSize(2, 0);

    buf = &_buf;
    buf->terrain_l = gBanimFloorfx[0];
    buf->pal_l = 4;
    buf->chr_l = 0x280;
    buf->terrain_r = gBanimFloorfx[1];
    buf->pal_r = 5;
    buf->chr_r = 0x280;
    buf->distance = gEkrDistanceType;
    buf->unk0E = 0x2;
    buf->unk1C = NULL;
    buf->unk20 = gUnk_Banim_Ekrbattle_0;
    buf->unk10 = gEkrSnowWeather;

    if (GetBattleAnimArenaFlag() == false) {
        BG_SetPosition(2, 0, 0);
        InitBanimTerrain(&_buf);
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x2);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x2);

    CpuFastFill(0, gBG1TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    EkrGauge_Setup44(0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    EndFaceById(0);
    Proc_Break(proc);
}
