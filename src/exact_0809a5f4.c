#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

//! FE8U = 0x0809831C
int CountSetBits(u16 a)
{
    int i;

    int count = 0;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            count++;
        }
    }

    return count;
}
