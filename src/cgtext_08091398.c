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
void CgText_1(struct CgTextMainProc * proc);

//! FE8U = 0x0808F0C4
void CgText_OnEnd(struct CgTextMainProc * proc)
{
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);
    CgText_1(proc);
    SetSecondaryHBlankHandler(NULL);
    return;
}
