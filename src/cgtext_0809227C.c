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
void CgText_ClearSpriteText(struct CgTextMainProc * proc);
void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut);

//! FE8U = 0x0808FF9C
void CgTextInterpreter_2(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    CgText_ClearSpriteText(parent);

    parent->thIndex = 0;

    parent->textWidth = 0;
    parent->textHeight = 0;
    GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

    return;
}
