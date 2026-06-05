#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "bmbattle.h"
#include "uimenu.h"
#include "icon.h"
#include "bmitem.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "menuitempanel.h"
#include "functions.h"

void MenuItemPanelProcIdle(struct MenuItemPanelProc * proc);

struct ProcCmd CONST_DATA gProcCmd_MenuItemPanel[] = {
	PROC_15,
	PROC_REPEAT(MenuItemPanelProcIdle),
	PROC_END,
};

void MenuItemPanelProcIdle(struct MenuItemPanelProc * proc)
{
	if (0 == proc->draw_arrow)
		return;

	if (proc->ItemSlotIndex < 0)
		return;
    
	/* atk */
	if (gBattleActor.battleAttack > gBattleTarget.battleAttack)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 3) * 8, 0);
	if (gBattleActor.battleAttack < gBattleTarget.battleAttack)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 3) * 8, 1);

	/* hit */
	if (gBattleActor.battleHitRate > gBattleTarget.battleHitRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 5) * 8, 0);
	if (gBattleActor.battleHitRate < gBattleTarget.battleHitRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 5) * 8, 1);

	/* crit */
	if (gBattleActor.battleCritRate > gBattleTarget.battleCritRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 3) * 8, 0);
	if (gBattleActor.battleCritRate < gBattleTarget.battleCritRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 3) * 8, 1);

	/* avoid */
	if (gBattleActor.battleAvoidRate > gBattleTarget.battleAvoidRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 5) * 8, 0);
	if (gBattleActor.battleAvoidRate < gBattleTarget.battleAvoidRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 5) * 8, 1);

}

void ForceMenuItemPanel(ProcPtr _menu_proc, struct Unit * unit, int x, int y)
{
	struct MenuProc *menu_proc = _menu_proc;
	struct MenuItemPanelProc * proc;

	if (NULL == Proc_Find(gProcCmd_MenuItemPanel)) {
		proc = Proc_Start(gProcCmd_MenuItemPanel, menu_proc);
		proc->unit = unit;
		proc->x = x;
		proc->y = y;
		proc->IconPalIndex = 3;
		proc->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
		proc->draw_arrow = TRUE;

		InitTextDb(&proc->text[0], 0xC);
		InitTextDb(&proc->text[1], 0xC);
		InitTextDb(&proc->text[2], 0xC);

		LoadIconPalette(1, proc->IconPalIndex);
		BattleGenerateUiStats(proc->unit, BU_ISLOT_AUTO);

		gBattleTarget.battleAttack = gBattleActor.battleAttack;
		gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
		gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
		gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
	}
}
