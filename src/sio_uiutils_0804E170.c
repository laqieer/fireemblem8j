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

//! FE8U = 0x0804D3DC
void LAPhaseIntro_StartBgm(void)
{
    StartBgm(SONG_COMBAT_PREPARATION, &gMPlayInfo_BGM2);
    return;
}
