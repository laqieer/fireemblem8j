#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"


struct Struct8012F98 {
    u8* dst;
    int unk_04;
};
struct Unk_80131A8
{
    /* 00 */ STRUCT_PAD(0x0, 0x4C);
    /* 4C */ u16 unk_4C;
};
struct Proc8599FD4 {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};
struct ProcSpacialSeTest {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};
struct PalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct PalFadeSt * st;
};
struct FadeKindEnt {
    ProcPtr (* spawn_proc)(const struct ProcCmd* script, ProcPtr parent);
    void (* setup_color_fade)(u8 component_step);
    int unit;
};
extern struct FadeKindEnt const gBmlib_0[];

void StartFadeCore(int kind, int speed, ProcPtr parent, void * end_callback)
{
    ProcPtr (* spawn_proc)(struct ProcCmd const * scr, ProcPtr parent);
    void (* setup_color_fade)(s8 component_step);

    struct FadeCoreProc * proc;
    int component_step;

    spawn_proc = gBmlib_0[kind].spawn_proc;
    proc = spawn_proc(ProcScr_FadeCore, parent);

    proc->speed = speed;
    proc->on_end = end_callback;

    component_step = proc->speed >> 4;

    if (component_step == 0)
        component_step = 1;

    // need to cast because parameter types don't match (int vs. i8)
    setup_color_fade = (void *) gBmlib_0[kind].setup_color_fade;
    setup_color_fade(component_step * gBmlib_0[kind].unit);
}
