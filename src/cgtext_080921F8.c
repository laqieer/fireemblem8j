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
void CgText_ResetSpriteTextCursors(struct CgTextMainProc * proc);
void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut);
void CgText_ScrollVramUp(int * src, int x, int y);

//! FE8U = 0x0808FF18
void CgTextInterpreter_1(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    int a = (parent->thIndex + 1) * 2;

    CgText_ScrollVramUp(parent->vram, parent->boxWidth, a);

    proc->unk_4c++;

    if (proc->unk_4c == parent->unk_5f * 16)
    {
        CgText_ResetSpriteTextCursors(parent);

        parent->thIndex -= parent->unk_5f - 1;

        parent->textWidth = 0;
        parent->textHeight = 0;
        GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

        parent->textHeight = parent->thIndex * 16 + parent->textHeight;

        Proc_Break(proc);
    }

    return;
}
