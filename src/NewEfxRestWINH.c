#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void EfxMagicHBlank_0(void);
void EfxMagicHBlank_1(void);

void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c)
{
    u32 i;
    u16 *buf;
    struct ProcEfx *proc;

    int bb = (s16)b;

    gEfxBgSemaphore++;

    if (c == 2) {
        buf = gpBg2ScrollOffsetTable1;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = bb;

        buf = gpBg2ScrollOffsetTable2;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = bb;

        gEkrBg2ScrollFlip = 0;
        gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        gpBg2ScrollOffset = gpBg2ScrollOffsetTable1;
    }

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = bb;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = bb;

    gEkrBg1ScrollFlip = 0;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;

    switch (c) {
    case 0:
        SetPrimaryHBlankHandler(EfxMagicHBlank_0);
        break;

    case 1:
        SetPrimaryHBlankHandler(EfxMagicHBlank_1);
        break;

    case 2:
        SetPrimaryHBlankHandler(EfxMagicHBlank_1);
        break;
    }

    proc = Proc_Start((const struct ProcCmd *)0x085FF238, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = a;
    proc->unk48 = c;
}
