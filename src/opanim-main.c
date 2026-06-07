#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void OpAnim1_UpdateScroll(int new, int old);

//! FE8U = 0x080C8690
void OpAnimJoshuaScrollIn(struct ProcOpAnim * proc)
{
    int i;
    s16 * vram;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);

    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimGenericCharacterBG, (void *)(0x06002000 + GetBackgroundTileDataOffset(3)));
            Decompress(Tsa_OpAnimGenericCharacterBG, gBG3TilemapBuffer);

            for (i = 0; i < 0x280; i++)
            {
                gBG3TilemapBuffer[i] = gBG3TilemapBuffer[i] + 0xe100;
            }

            BG_EnableSyncByMask(BG3_SYNC_BIT);

            break;

        case 2:
            Decompress(Img_OpAnimJoshua, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimJoshua, gGenericBuffer);

            break;

        case 3:
            Decompress(Img_OpAnimJoshua2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimJoshua2, gGenericBuffer + 0x800);

            break;

        case 4:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);
            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;

        case 5:
            Decompress(Img_OpAnimShiningRing, (void *)0x06004000);

            break;

        case 6:
            Decompress(Tsa_OpAnimShiningRing, (void *)0x0600F000);

            vram = (void *)0x0600F000;

            for (i = 0; i < 0x280; i++, vram++)
            {
                *vram = *vram - 0x8000;
            }

            break;
    }

    if (proc->timer == 0x28)
    {
        Proc_EndEach(gUnkData_98);
        Proc_EndEach(gUnkData_99);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C883C
void OpAnimScrollInLArachel(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimLArachel, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimLArachel, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimLArachel2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimLArachel2, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        Proc_EndEach(gUnkData_98);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8934
void OpAnimScrollInSeth(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimSeth, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimSeth, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimSeth2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimSeth2, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8A20
void OpAnimScrollInMyrrh(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimMyrrh, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimMyrrh, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimMyrrh2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimMyrrh2, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8B0C
void OpAnimScrollInSaleh(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimSaleh, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimSaleh, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimSaleh2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimSaleh2, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8BF8
void OpAnimScrollInTethys(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimTethys, (void *)(VRAM + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimTethys, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimTethys2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimTethys2, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8CE4
void OpAnimScrollInBlank(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
