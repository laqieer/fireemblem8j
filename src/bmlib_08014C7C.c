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

/* file-scope type definitions used by this run */


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

void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width)
{
    int off;

    off = GetStringTextLen(str);
    off = (width*8 - off) >> 1;

    Text_SetCursor(text, off);
    Text_DrawString(text, str);

    PutText(text, gBG0TilemapBuffer + TILEMAP_INDEX(x, y));
}

int GetEasedProgress(int timer, int speed, int a, int b)
{
    return Spline_Ease(DivArm(speed, timer * 0x1000), a, b);
}
