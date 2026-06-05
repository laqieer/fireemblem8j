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

//! FE8U = 0x080AEAE8
const char * CopyTextChar(char ** src, char ** dst)
{
    const char * result;
    int len;

    result = GetCharTextLen(*src, &len);
    result -= (uintptr_t)*src;

    memcpy(*dst, *src, (uintptr_t)result);

    *src = *src + (uintptr_t)result;
    *dst = *dst + (uintptr_t)result;

    return result;
}

//! FE8U = 0x080AEB1C
void ClearPrimaryHBlankHandler(void)
{
    SetPrimaryHBlankHandler(NULL);
    return;
}
