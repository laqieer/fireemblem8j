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

//! FE8U = 0x08097CC8
u8 GetConvoyItemCount_(void) {
    return GetConvoyItemCount();
}
