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

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc)
{
    struct ProcAtMenu *parent;
    MakePrepUnitList();
    proc->list_num_cur = UnitGetIndexInPrepList(PrepGetLatestCharId());
    proc->max_counter = ((struct ProcAtMenu *)(proc->proc_parent))->max_counter;
    proc->cur_counter = ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter;
    proc->yDiff_cur = ((struct ProcAtMenu *)(proc->proc_parent))->yDiff;
    proc->list_num_pre = proc->list_num_cur;
    proc->button_blank = 0;
}
