#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

void InitBanimTerrain(struct BanimUnkStructComm * buf)
{
    struct BattleAnimTerrain * a;
    struct BattleAnimTerrain * b;
    void * vramA;
    void * vramB;
    void * palA;
    void * palB;
    s16 oam2Pal;
    u16 oam2;

    a = &battle_terrain_table[buf->terrain_l];
    b = &battle_terrain_table[buf->terrain_r];

    if (buf->terrain_l != -1)
    {
        LZ77UnCompWram(a->tileset, buf->unk20);
    }

    if (buf->terrain_r != -1)
    {
        LZ77UnCompWram(b->tileset, buf->unk20 + 0x1000);
    }

    switch (buf->distance) {
    case 0:
    case 4:
        vramA = buf->unk20;
        vramB = buf->unk20 + 0x1000;
        break;

    case 1:
    case 2:
    case 3:
    default:
        vramA = buf->unk20 + 0x800;
        vramB = buf->unk20 + 0x1800;
        break;
    }

    palA = a->palette;
    palB = b->palette;

    switch (buf->unk0E) {
    case -1:
    case 0:
    case 1:
    case 2:
    case 3:
        break;

    default:
        break;
    }

    if (buf->unk0E != -1)
    {
        if (buf->unk0E >= -1)
        {
            if (buf->unk0E < 4)
            {
                int vram = ((buf->chr_l + 0x40) * 0x20 + VRAM);
                RegisterDataMove(vramA, (void *)(buf->unk1C + vram), 0x800);
                vram = (buf->chr_r * 0x20 + VRAM);
                RegisterDataMove(vramB, (void *)(buf->unk1C + vram), 0x800);

                CpuFastCopy(palA, gPaletteBuffer + buf->pal_l * 0x10, 0x20);
                CpuFastCopy(palB, gPaletteBuffer + buf->pal_r * 0x10, 0x20);

                EnablePaletteSync();
                RegisterBanimTerrainTm(buf);
            }
        }
    }
    else
    {
        if (buf->terrain_l != -1)
        {
            RegisterDataMove(vramA, (void *)(buf->unk1C + buf->chr_l * 0x20), 0x800);
            CpuFastCopy(palA, buf->pal_l * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        if (buf->terrain_r != -1)
        {
            RegisterDataMove(vramB, (void *)(buf->unk1C + buf->chr_r * 0x20), 0x800);
            CpuFastCopy(palB, buf->pal_r * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        EnablePaletteSync();
    }

    switch (buf->unk0E) {
    case 0:
        BG_EnableSyncByMask(BG0_SYNC_BIT);
        return;

    case 1:
        BG_EnableSyncByMask(BG1_SYNC_BIT);
        return;

    case 2:
        BG_EnableSyncByMask(BG2_SYNC_BIT);
        return;

    case 3:
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        return;

    case -1:
        buf->proc14 = NULL;
        buf->proc18 = NULL;

        if (buf->terrain_r != -1)
        {
            switch (buf->distance) {
            case 0:
            case 4:
                oam2Pal = buf->pal_r;
                oam2 = (oam2Pal << 0xc) | buf->chr_r | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xa8, 0x68, AnimScr_EkrMainMini_L_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = buf->pal_r;
                oam2 = (oam2Pal << 0xc) | buf->chr_r | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = buf->pal_r;
                oam2 = (oam2Pal << 0xc) | buf->chr_r | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = buf->pal_r;
                oam2 = (oam2Pal << 0xc) | buf->chr_r | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0x80, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        if ((buf->terrain_l != -1))
        {
            switch (buf->distance) {
            case 0:
            case 4:
                oam2Pal = buf->pal_l;
                oam2 = (oam2Pal << 0xc) | buf->chr_l | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x48, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = buf->pal_l;
                oam2 = (oam2Pal << 0xc) | buf->chr_l | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x20, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = buf->pal_l;
                oam2 = (oam2Pal << 0xc) | buf->chr_l | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x40, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = buf->pal_l;
                oam2 = (oam2Pal << 0xc) | buf->chr_l | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x78, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        break;
    }
}
