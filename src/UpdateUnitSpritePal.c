#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0808DEF0
void UpdateUnitSpritePal(bool isHidden)
{
    if (isHidden)
    {
        // If unit is under a roof or obscured by fog, use a fully-black palette
        CpuFastFill16(RGB_BLACK, PAL_OBJ(13), PLTT_SIZE_4BPP);
        EnablePaletteSync();
    }
    else
    {
        ApplyUnitSpritePalettes();
    }

    return;
}
