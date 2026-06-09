#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "bmsave.h"
#include "ap.h"
#include "sysutil.h"
#include "constants/songs.h"

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int msgId;
};

//! FE8U = 0x080AEC04
bool IsPointInTriangle(int a, int b, int c, int d, int e, int f, int g, int h)
{

    if (((c - a) * (f - b) - (d - b) * (e - a)) < 0)
    {
        return FALSE;
    }

    if (((e - a) * (h - b) - (f - b) * (g - a)) < 0)
    {
        return FALSE;
    }

    if (((g - a) * (d - b) - (h - b) * (c - a)) < 0)
    {
        return FALSE;
    }

    return TRUE;
}
