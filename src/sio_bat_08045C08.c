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

//! FE8U = 0x08045C68
void SioBat_StartTalkText(const char * str, int x, int y, ProcPtr parent)
{
    SetInitTalkTextFont();
    ClearTalkText();
    ResetTextFont();

    StartTalkExt(x, y, str, parent);

    SetTalkPrintColor(1);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetTalkPrintDelay(2);

    SetActiveTalkFace(1);

    return;
}
