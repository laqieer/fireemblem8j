#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

void PromoTrainee_InitScreen(struct ProcPromoTraineeEvent *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct Unit *unit;
    proc->pid = parent->pid;
    unit = GetUnitFromCharId(proc->pid);
    if (unit)
        proc->face = unit->pCharacterData->portraitId;
    else
        proc->face = 0;

    ResetFaces();
    ResetText();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_EnableSyncByMask(2);
    RestartMuralBackground();
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(0xf);

    SetDispEnable(1, 0, 0, 1, 1);
    InitTalk(0x200, 3, 1);
    SetBlendConfig(1, 14, 8, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}
