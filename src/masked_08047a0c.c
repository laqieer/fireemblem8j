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

/* prototypes for same-file helpers called by this run */
bool CheckSomethingSaveRelated(void);

//! FE8U = 0x08047AF4
void SioMenu_Init(void)
{
    int i;

    gLinkArenaSt.unk_0A = CheckSomethingSaveRelated();

    for (i = 0; i < 0x10; i++)
    {
        gKeyInputSequenceBuffer[i] = 0;
    }

    gCurrentKeyInSeqIndex = gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;

    return;
}
