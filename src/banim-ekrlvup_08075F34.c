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
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void InitBanimTerrain(void *);

//! JP = 0x08075F34
void EkrLvup_InitScreen(struct ProcEkrLevelup *proc)
{
    struct BanimUnkStructComm * buf = &gEkrlvup_1;

    CpuFastFill(0, gBG1TilemapBuffer, 0x800);
    CpuFastFill(0, gBG2TilemapBuffer, 0x800);

    RegisterDataMove(gBG1TilemapBuffer, BG_SCREEN_ADDR(0xD), 0x800);
    RegisterDataMove(gBG1TilemapBuffer, BG_SCREEN_ADDR(0xE), 0x800);
    RegisterDataMove(gBG2TilemapBuffer, BG_SCREEN_ADDR(0xA), 0x800);
    RegisterDataMove(gBG2TilemapBuffer, BG_SCREEN_ADDR(0xB), 0x800);

    buf->terrain_l = gBanimFloorfx[EKR_POS_L];
    buf->pal_l = 3;
    buf->chr_l = 0x100;
    buf->terrain_r = gBanimFloorfx[EKR_POS_R];
    buf->pal_r = 4;
    buf->chr_r = 0x140;
    buf->distance = gEkrDistanceType;
    buf->unk0E = -1;
    buf->unk1C = OBJ_VRAM0;
    buf->unk20 = gUnk_Banim_Ekrbattle_0;
    buf->unk10 = (u16)gEkrSnowWeather;

    if (gEkrDistanceType == 2) {
        if (gEkrInitPosReal == 0)
            buf->terrain_r = -1;
        else
            buf->terrain_l = -1;
    }

    if (GetBattleAnimArenaFlag() == false) {
        struct ProcEkrSubAnimeEmulator * _buf;
        InitBanimTerrain(buf);

        _buf = buf->proc14;
        _buf->oam2Base &= (u16)~OAM2_LAYER(0x3);
        _buf->oam2Base |=       OAM2_LAYER(0x3);
        _buf = buf->proc18;
        _buf->oam2Base &= (u16)~OAM2_LAYER(0x3);
        _buf->oam2Base |=       OAM2_LAYER(0x3);
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x3);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x3);

    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gEkrLvupScrollPos1 = 0x90;
    gEkrLvupScrollPos2 = 0x90;

    BG_SetPosition(2, 0, 8);
    BG_SetPosition(1, 0, 8);

    SetBackgroundMapDataOffset(0, 0x6000);
    SetBackgroundMapDataOffset(1, 0x6800);
    SetBackgroundMapDataOffset(2, 0x5000);

    SetBackgroundScreenSize(1, 1);
    SetBackgroundScreenSize(2, 1);

    gpProcEfxPartsofScroll = NewEfxPartsofScroll();
    gpProcEfxleveluphb = NewEfxleveluphb();
    EfxUpdatePartsofScroll();
    EkrGauge_Setup44(2);
    DisableEfxStatusUnits(proc->ais_main);
    DisableEfxStatusUnits(proc->ais_core);

    DisableEfxWeaponIcon();
    DisableEfxHpBarColorChange();

    SetWinEnable(0, 0, 0);
    SetDefaultColorEffects();
    Proc_Break(proc);
}
