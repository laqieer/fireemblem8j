#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

//! FE8U = 0x080D2100
void ClassChgSel_SetupBattleTerrain(u32 a, s16 b, s16 c) {
    int bi = b;
    int ci = c;

    gEkrbattle_9.terrain_l = a;
    gEkrbattle_9.pal_l = 0xe;
    gEkrbattle_9.chr_l = 0x380;
    gEkrbattle_9.terrain_r = a;
    gEkrbattle_9.pal_r = 0xf;
    gEkrbattle_9.chr_r = 0xf0 << 2;
    gEkrbattle_9.distance = 0;
    gEkrbattle_9.unk0E = -1;
    gEkrbattle_9.unk1C = (void *)0x06010000;
    gEkrbattle_9.unk20 = gUnk_Banim_Ekrbattle_0;
    InitBanimTerrain(&gEkrbattle_9);

    SetBanimTerrainPos(&gEkrbattle_9, bi, ci, bi + 0x60, ci);
}
