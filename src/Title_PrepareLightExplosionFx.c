extern int Title_ClearLightExplosionScratch();
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

//! FE8U = 0x080C6104
void Title_PrepareLightExplosionFx(struct TitleScreenProc* proc) {

    SetBlendConfig(1, 0x10, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    proc->unk_30 = 0;

    Title_ClearLightExplosionScratch();

    return;
}
