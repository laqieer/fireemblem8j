#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmdebug.h"

struct CfgStrings80DC6C4
{
    const char *strings[7];
};

extern const struct CfgStrings80DC6C4 gUnk_080DC6C4;
extern const char gUnk_080DC6E0[];

struct ProcDebugMonitorRow
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ s16 x;
    /* 2C */ s16 y;
    /* 2E */ STRUCT_PAD(0x2E, 0x34);
    /* 34 */ struct Text text;
};

struct ProcDebugMonitor
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int _58;
};

// JP-only debug-monitor text-draw row helper.
int sub_801BA6C(int unused, struct ProcDebugMonitorRow *proc)
{
    struct CfgStrings80DC6C4 cfg;
    struct ProcDebugMonitor *mon;
    int i;

    cfg = gUnk_080DC6C4;

    mon = (struct ProcDebugMonitor *)Proc_Find(ProcScr_DebugMonitor);

    ClearText(&proc->text);
    Text_InsertDrawString(&proc->text, 8, 0, gUnk_080DC6E0);

    i = mon->_58 % 7;
    Text_InsertDrawString(&proc->text, 0x40, 2, cfg.strings[i]);

    PutText(&proc->text, gBG0TilemapBuffer + ((proc->y << 5) + proc->x));

    return 0;
}
