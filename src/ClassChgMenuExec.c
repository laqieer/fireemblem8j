#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"
/* TU-private data externs bound at their JP addresses */
extern struct MenuRect ClassChgMenuRect;

void ClassChgMenuExec(struct ProcClassChgMenuSel *proc)
{
    proc->unk4C = 0;
    ResetTextFont();
    ResetText();
    SetTextFontGlyphs(0);
    InitTextFont(&gFontClassChg, (void *)BG_VRAM + 0x1400, 160, 5);
    SetTextFont(&gFontClassChg);
    proc->pmenu = StartMenuCore(
		&gMenuDef_PromoSel,
		ClassChgMenuRect,
		2,
		0,
		0,
		0,
		(struct Proc *) proc);
}
