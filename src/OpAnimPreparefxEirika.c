#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C7CF8
void OpAnimPreparefxEirika(struct ProcOpAnim * proc)
{
    int i;
    u16 * it;

    switch (proc->timer)
    {
        case 0:
            SetDispEnable(0, 0, 0, 1, 1);
            SetWinEnable(0, 0, 0);

            SetBackgroundMapDataOffset(BG_2, 0xe800);

            BG_SetPosition(BG_0, 0, 0);
            BG_SetPosition(BG_1, 0, 0);
            BG_SetPosition(BG_2, 0, 0);

            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);
            BG_Fill(gBG2TilemapBuffer, 0);

            BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

            SetBlendBackdropA(0);
            SetBlendBackdropB(0);
            SetBlendConfig(BLEND_EFFECT_ALPHA, 8, 8, 8);

            SetBlendTargetA(0, 1, 0, 0, 0);
            SetBlendTargetB(0, 0, 1, 1, 0);

            break;

        case 1:
            Decompress(Img_OpAnimEirikaClose1, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimEirikaClose1, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimEirikaClose2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimEirikaClose2, gGenericBuffer + 0x800);

            break;

        case 3:
            Decompress(Img_OpAnimEirika, (void *)(VRAM + GetBackgroundTileDataOffset(2)));
            Decompress(Tsa_OpAnimEirika, gGenericBuffer + 0x1000);
            CopyToPalOpAnim(Pal_OpAnimEirikaBlur, 0, 0x160);

            break;

        case 4:
            Decompress(Img_OpAnimEirikaBlur3, (void *)(0x06008000));
            Decompress(Tsa_OpAnimEirikaBlur3, (void *)(0x0600C000));

            break;

        case 5:
            Decompress(Img_OpAnimEirikaBlur2, (void *)(0x0600A000));
            Decompress(Tsa_OpAnimEirikaBlur2, (void *)(0x0600C800));

            it = (void *)0x0600C800;
            for (i = 0; i < 0x280; i++)
            {
                it[i] = it[i] + 0x100;
            }

            break;

        case 6:
            CpuFastSet(gGenericBuffer + 0x1000, gGenericBuffer + 0x1800, 0x200);

            it = (u16 *)(gGenericBuffer + 0x1800);
            for (i = 0; i < 0x280; i++)
            {
                it[i] = (it[i] & 0xFFF) | 0xf000;
            }

            CpuFastSet(it, (void *)0x0600F000, 0x140);
            EnablePaletteSync();

            SetDispEnable(0, 1, 1, 1, 1);

            proc->timer = 0;
            proc->unk30 = 0;
            proc->unk32 = 0;

            gOpAnimSt.x = DISPLAY_WIDTH;
            gOpAnimSt.y = 0;
            gOpAnimSt.unk04 = 0;
            gOpAnimSt.unk06 = DISPLAY_HEIGHT;

            SetBackgroundTileDataOffset(BG_2, 0x8000);

            Proc_Break(proc);

            return;
    }

    proc->timer++;

    return;
}
