#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08098C8C
void PutImg_PrepPopupWindow(int vram, int pal)
{
    Decompress(Img_PrepPopupWindow, OBJ_CHR_ADDR(0x0) + vram);
    ApplyPalette(gUiFramePaletteD, pal + 0x10);
    return;
}
