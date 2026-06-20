#include "global.h"
#include "proc.h"
#include "fontgrp.h"
void LoadLegacyUiFrameGraphics(void);
void sub_8049664(void *p) {
    LoadLegacyUiFrameGraphics();
    InitTextFont((struct Font *)0x0203DB60, (void *)0x06001800, 0xc0, 0);
    Proc_StartBlocking((const struct ProcCmd *)0x085D4010, (ProcPtr)p);
}
