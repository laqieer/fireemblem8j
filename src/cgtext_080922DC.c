#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

extern EWRAM_DATA struct CgTextSt gCgTextSt;

// clang-format off





/* prototypes for same-file helpers called by this run */
u32 GetCgTextFlags(void);

//! FE8U = 0x0808FFFC
s8 IsCgTextBlocking(void)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_2)
    {
        return 1;
    }

    return 0;
}
