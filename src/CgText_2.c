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

//! FE8U = 0x0808F0EC
void CgText_2(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);

    proc->thIndex = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    proc->textWidth = 0;
    proc->textHeight = 0;
    GetCgTextDimensions(proc->str, &proc->textWidth, &proc->textHeight);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    RestartCgTextInterpreter(proc);

    return;
}
