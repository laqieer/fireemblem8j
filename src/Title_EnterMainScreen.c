#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_DrawTitleSprites[];

//! FE8U = 0x080C62DC
void Title_EnterMainScreen(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundScreenSize(2, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    Proc_Start(gProcScr_DrawTitleSprites, proc);

    SetBlendConfig(1, 8, 8, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    return;
}
