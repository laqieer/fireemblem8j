#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

//! FE8U = 0x0804C3A8
void Nop_SioUiutils_0(void)
{
    return;
}

//! FE8U = 0x0804C3AC
void CopyLinkArenaTileRows(u8 * src, u8 * dst, int c, int d)
{
    int i;

    int r7 = c << 5;

    for (i = 0; i < d; i++)
    {
        CpuFastCopy(src, dst, (r7 * 0x20) / 0x20);
        src += 0x400;
        dst += 0x400;
    }

    return;
}

//! FE8U = 0x0804C3EC
void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc)
{
    int a = (proc->unk_58 % 3) * 0x140;
    int b = (proc->unk_58 / 3) * 0x800;

    Decompress(gUnkData_25, (void *)(VRAM + proc->chr));
    Decompress(gUnkData_5, gGenericBuffer);

    CopyLinkArenaTileRows(gGenericBuffer + (a + b), OBJ_CHR_ADDR(0x200), 10, 2);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnkData_26, (((u16)(proc->chr >> 1) >> 4)) | 0x1000);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

// clang-format on

//! FE8U = 0x0804C47C
void LATitleBanner_Loop(void)
{
    PutSpriteExt(4, 20, 8, Sprite_LinkArena_MenuTitle, 0);
    return;
}

// clang-format on

//! FE8U = 0x0804C49C
void StartLinkArenaTitleBanner(ProcPtr parent, int size, int chr)
{
    struct LinkArenaTitleBannerProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    proc = Proc_Start(ProcScr_LinkArenaTitleBanner, parent);

    proc->unk_58 = size;
    proc->chr = chr;

    if (chr == 0)
    {
        proc->chr = 0x2E0 * CHR_SIZE;
    }

    proc->unk_2c = (proc->unk_58 % 3) * 0x140;
    proc->unk_30 = (proc->unk_58 / 3) * 0x800;

    return;
}

//! FE8U = 0x0804C4F8
void EndLinkArenaTitleBanner(void)
{
    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    return;
}

//! FE8U = 0x0804C508
void SetLinkArenaUiBlendAndWindowOff(void)
{
    SetBlendAlpha(16, 4);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetWinEnable(0, 0, 0);

    return;
}
