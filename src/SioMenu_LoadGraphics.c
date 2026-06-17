#include "global.h"
#include "bmsave.h"
#include "bmlib.h"
#include "face.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmio.h"
#include "uiutils.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"



extern struct FaceVramEntry  FaceConfig_SioMenu_0[];

void SioMenu_LoadGraphics(struct SioMenuProc * proc)
{
    int enabled;
    int i;

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(Img_LinkArenaMenu, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_LinkArenaMenu, 0x13, 3);

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    InitSioTexts();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->menuItemState[0] = true;

    enabled = proc->unk_58 != 0;
    proc->menuItemState[1] = enabled;
    proc->menuItemState[2] = enabled;
    proc->menuItemState[3] = enabled;

    if (proc->unk_59 == 0)
    {
        enabled = false;
        proc->unk_50 = 3;
    }
    else
    {
        enabled = true;
        proc->unk_50 = 4;
    }

    proc->menuItemState[4] = enabled;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->menuItemState[proc->unk_48] = 2;

    for (i = 4; i >= 0; i--)
    {
        proc->menuItems[i] = StartSioMenuItem(proc, 176, 160, i, proc->menuItemState[i]);
    }

    StartLinkArenaTitleBanner(proc->menuItems[0], 0, 0);
    SetLinkArenaUiBlendAndWindowOff();

    SetupFaceGfxData(FaceConfig_SioMenu_0);
    StartFace(3, 0x65, 208, 80, FACE_DISP_KIND(FACE_96x80));

    proc->unk_54 = 0;

    StartBgm(SONG_COLOSSEUM_ENTRANCE, 0);
    LinkArenaBattleMap_InitConfig();

    return;
}
