#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

/* .section(.bss) */
static struct PopupInstruction gPopupInst[4];
static struct Unit * gpPopupUnit;
static u16 gPopupItem;
static u32 gPopupNumber;

























/* prototypes for same-file helpers called by this run */
ProcPtr NewPopupCore(const struct PopupInstruction *inst, int clock, int winStyle, int iconObjTileId, int pal_base, /* proc->iconPalId - 0x10 */ ProcPtr parent);

void SetPopupUnit(struct Unit* unit)
{
    gpPopupUnit = unit;
}

ProcPtr NewPopup_Simple(const struct PopupInstruction *inst,
                    int clock,
                    int winStyle,
                    ProcPtr parent)
{
    return NewPopupCore(inst, clock, winStyle, 0x240, 4, parent);
}
