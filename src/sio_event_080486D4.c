#include "global.h"

#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmsave.h"
#include "scene.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "agb_sram.h"
#include "sram-layout.h"
#include "face.h"
#include "event.h"

#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

//! FE8U = 0x080487C0
void EndSioMenuForXMapTransfer(struct Proc * proc)
{
    int i;
    struct SioMenuItemProc ** iter;

    struct SioMenuProc * pSioMenuProc = proc->proc_parent;

    EndFaceById(3);

    iter = pSioMenuProc->menuItems;

    for (i = 0; i < 5; i++)
    {
        Proc_End(*iter++);
    }

    InitSioBG();
    Nop_SioUiutils_1(0, 0);

    gSioSt->unk_000 = 3;

    SetTextFont(&Font_0);
    InitSystemTextFont();

    InitTextDb(gUnk_Sio_7, 10);

    Sound_FadeOutBGM(1);

    return;
}
