#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"

#include "constants/songs.h"

/*
The opening monologue that introduces the Sacred Stones / associated lore.
*/

struct OpSubtitleProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 index;
    /* 2A */ s16 timer_2a;
    /* 2C */ s16 timer_2c;

    /* 2E */ u8 pad[0x4c-0x2e];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct OpSubtitleEnt {
    void* gfx;
    void* tsa;
    int timer;
};



//! FE8U = 0x080C4A3C
void Subtitle_LightFlareFx_Init(struct OpSubtitleProc* proc) {
    proc->unk_4c = 0;
    proc->unk_4e = 0;

    BlitU8TileMapData(gBG2TilemapBuffer, Tsa_UnkData_6, 0, 5);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x080C4A88
void Subtitle_LightFlareFx_Loop(struct OpSubtitleProc* proc) {
    int a;
    int b;
    int c;
    int d;

    if (proc->unk_4c < 30) {
        a = Interpolate(5, 4, 50, proc->unk_4c, 30);
        b = Interpolate(4, 0, 16, proc->unk_4c, 30);
    } else {
        a = Interpolate(0, 50, 100, proc->unk_4c - 30, 30);
        b = Interpolate(0, 16, 0, proc->unk_4c - 30, 30);
    }

    if (a > 49) {
        a = 100 - a;
    }

    c = Interpolate(0, 0, 214, proc->unk_4c, 60);
    d = Interpolate(0, 16, 128, proc->unk_4c, 60);

    BgAffinRotScaling(2, proc->unk_4e, 0, 0, a * 5 + 0x80, a * 5 + 0x80);
    BgAffinScaling(2, 0x100, 0x100);
    BgAffinAnchoring(2, c, d, 80, 72);

    proc->unk_4e -= 64;

    SetBlendConfig(1, b, 0x10, 0);

    proc->unk_4c++;

    if (proc->unk_4c > 59) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C4BA0
void Subtitle_LightFlareFx_End(void) {
    gLCDControlBuffer.dispcnt.bg2_on = 0;

    return;
}

void OpSubtitle_FadePalette(u16* src, u16* dst, int count, int coeff) {
    u16* srcIt;
    u16* dstIt;
    int i;

    if (count <= 0) {
        return;
    }

    dstIt = dst;
    srcIt = src;
    for (i = count; i; i--) {
        int color = (*srcIt);

        s16 r = DivArm(0x1000, (color & 0x1f) * coeff);
        s16 g = DivArm(0x1000, ((color >> 5) & 0x1f) * coeff);
        s16 b = DivArm(0x1000, ((color >> 10) & 0x1f) * coeff);

        *dstIt++ = (u32)r + ((u32)g << 5) + ((u32)b << 10);
        do srcIt++; while (0);
    }
}
