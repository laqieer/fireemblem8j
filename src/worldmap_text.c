#include "global.h"

#include "ctc.h"
#include "scene.h"
#include "hardware.h"

#include "worldmap.h"

/* file-scope type definitions used by this run */


struct GMapTextProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 drawAtBottom;
    /* 2A */ u8 visible;
};

/* prototypes for same-file helpers called by this run */
void ClearWmTextVram(void);

//! FE8U = 0x080C35C4
void WmText_Init(struct GMapTextProc * proc)
{
    proc->drawAtBottom = 1;
    proc->visible = 0;

    ClearWmTextVram();

    gWmHblankStatus &= ~1;

    return;
}
