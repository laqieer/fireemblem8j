#include "global.h"
#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"


void PutClassNameIntroLetter(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset) {
    int i;
    int k;

    for (i = 1; i < 0x10; i++) {
        if (i + offset >= 0x10) {
            int j = 0xF;
            gPaletteBuffer[0x110 + charId * 0x10 + i] = gPaletteBuffer[0x100 + j];
        } else {
            gPaletteBuffer[0x110 + charId * 0x10 + i] = gPaletteBuffer[0x100 + i + offset];
        }

        k = charId + 1;
    }

    EnablePaletteSync();

    if (yScale <= 8) {
        return;
    }

    if (xScale < 8) {
        xScale = 8;
    }

    SetObjAffine(
        charId,
        Div(+COS(0) << 4, xScale),
        Div(-SIN(0) << 4, yScale),
        Div(+SIN(0) << 4, xScale),
        Div(+COS(0) << 4, yScale)
    );

    if (offset != 0) {
        PutSpriteExt(
            4,
            (x & 0x1FF) + (charId << 9),
            y & 0x1FF,
            (const u16 *)0x08AAFCAC,
            charId * 4 + (k & 0xF) * 0x1000 + 0x800
        );
    } else {
        PutSpriteExt(
            4,
            (x & 0x1FF) + (charId << 9),
            y & 0x1FF,
            (const u16 *)0x08AAFCAC,
            charId * 4 + (k & 0xF) * 0x1000 + 0x400
        );
    }

    return;
}
