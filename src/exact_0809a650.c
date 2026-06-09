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

//! FE8U = 0x08098378
int GetFirstSetBitIndex(u16 a)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            return i;
        }
    }

    return 0;
}
