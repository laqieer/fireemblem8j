#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"

struct Unk8049460Proc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ int unk54;
};

extern void sub_80B5224(struct Unk8049460Proc * proc);
extern int sub_804944C(struct Unk8049460Proc * proc);
extern const struct ProcCmd ProcScr_8049460[];

// JP-only menu/UI proc init.
void sub_8049460(struct Unk8049460Proc * proc)
{
    LoadGameCoreGfxLegacyFrame();
    sub_80B5224(proc);
    Proc_EndEach(ProcScr_8049460);
    proc->unk54 = sub_804944C(proc);
    LoadLegacyUiFrameGraphics();
    DrawUiFrame(gBG1TilemapBuffer, 0x12, 0x10, 0xb, 4, 0, 0);
    BG_EnableSyncByMask(0xf);
}
