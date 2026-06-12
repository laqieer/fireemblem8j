#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void StartPageSlide(u16 key, int newPage, struct Proc* parent)
{
    struct StatScreenEffectProc* proc;

    if (Proc_Find(gProcScr_SSPageSlide))
        return;

    PlaySoundEffect(SONG_6F);

    proc = (void*) Proc_StartBlocking(gProcScr_SSPageSlide, parent);

    proc->timer = 0;
    proc->newItem = newPage;
    proc->key = key;

    gStatScreen.pageSlideKey = key;
    gStatScreen.help         = NULL;
    gStatScreen.inTransition = TRUE;
}
