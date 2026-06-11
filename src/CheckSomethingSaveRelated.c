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

//! FE8U = 0x08047AB8
bool CheckSomethingSaveRelated(void)
{
    int i;
    struct PlaySt playSt;

    for (i = 0; i < 3; i++)
    {
        if (!IsSaveValid(i))
        {
            continue;
        }

        ReadGameSavePlaySt(i, &playSt);

        if (IsGameNotFirstChapter(&playSt))
        {
            return true;
        }
    }

    return false;
}
