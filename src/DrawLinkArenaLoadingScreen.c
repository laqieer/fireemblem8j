#include "global.h"
#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"
#include "sio.h"
#include "sio_core.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x080467AC
void DrawLinkArenaLoadingScreen(struct SioBatProc * proc)
{
    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0, 0, 0);

    EndLinkArenaVersusSpriteDraw();
    EndFaceById(3);

    ClearText((struct Text *)0x0203DA74);
    Text_SetColor((struct Text *)0x0203DA74, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString((struct Text *)0x0203DA74, GetStringFromIndex(0x4D)); // "Now Loading"
    PutText((struct Text *)0x0203DA74, TILEMAP_LOCATED(gBG2TilemapBuffer, 9, 12));

    Proc_Start(gSioMain_0, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
