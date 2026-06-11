#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc)
{
    ((struct ProcAtMenu *)(proc->proc_parent))->yDiff = proc->yDiff_cur;
    ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter = proc->cur_counter;

    PrepSetLatestCharId(GetUnitFromPrepList(proc->list_num_cur)->pCharacterData->number);
    EndMuralBackground_();
}
