#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"

// TODO: Possibly debug-related procs for the world map?
// Seems to be unrelated to anything around it

struct UnknownWorldMapStructB
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct Text unk_34;
};
struct UnknownWorldMapStructA
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct UnknownWorldMapStructB * unk_34[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x60);
    /* 60 */ u8 unk_60;
};

//! FE8U = 0x080BC428
void WorldMap_ResetTextCursors(struct UnknownWorldMapStructA * a)
{
    int i = 0;

    if (i < a->unk_60)
    {
        struct UnknownWorldMapStructB ** unk_34 = a->unk_34;

        for (; i < a->unk_60; i++)
        {
            Text_SetCursor(&(*unk_34++)->unk_34, 0);
        }
    }

    return;
}
