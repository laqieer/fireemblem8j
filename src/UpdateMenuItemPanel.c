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

//! FE8U = 0x0801E3A4
void UpdateMenuItemPanel(int slot_or_item)
{
	struct MenuItemPanelProc * proc = Proc_Find(gProcCmd_MenuItemPanel);
	u16 * bg_base = BG_GetMapBuffer(0) + proc->x + 0x20 * proc->y;
	struct Text * texts = &proc->text[0];
	struct Unit * unit = proc->unit;
	int i, item, color, icon_pal = proc->IconPalIndex;
	char * str;

	ClearText(&proc->text[0]);
	ClearText(&proc->text[1]);
	ClearText(&proc->text[2]);

	DrawUiFrame2(proc->x, proc->y, 0xE, 0x8, 0x0);

	switch (slot_or_item) {
	case 0:
	case 1:
	case 2:
	case 3:
	case 4:
		item = unit->items[slot_or_item];
		break;

	case BU_ISLOT_5:
		item = gBmSt.um_tmp_item;
		break;

	default:
		item = slot_or_item;
		slot_or_item = BU_ISLOT_BALLISTA;
		break;
	} /* switch slot */

	switch (GetItemType(item)) {
	case ITYPE_STAFF:
	case ITYPE_ITEM:
	case ITYPE_MONSTER:
	case ITYPE_DANCE:
		str = GetStringFromIndex(GetItemUseDescId(item));
		i = 0;

		while (1) {
			Text_InsertDrawString(&texts[i], 0, TEXT_COLOR_SYSTEM_WHITE, str);
			str = GetStringLineEnd(str);

			if (0 == *str)
				break;

			str++;
			i++;
		}

		gBattleActor.battleAttack = gBattleTarget.battleAttack;
		gBattleActor.battleHitRate = gBattleTarget.battleHitRate;
		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
		gBattleActor.battleAvoidRate = gBattleTarget.battleAvoidRate;

		PutText(&texts[0], TILEMAP_LOCATED(bg_base, 1, 1));
		PutText(&texts[1], TILEMAP_LOCATED(bg_base, 1, 3));
		PutText(&texts[2], TILEMAP_LOCATED(bg_base, 1, 5));
		break;

	default:
		BattleGenerateUiStats(unit, slot_or_item);

		if (BU_ISLOT_BALLISTA == slot_or_item) {
			gBattleTarget.battleAttack = gBattleActor.battleAttack;
			gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
			gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
			gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
		}

		color = CanUnitUseWeapon(unit, gBattleActor.weapon) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY;

		Text_InsertDrawString(&texts[0], 0x1E, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x480));
		Text_InsertDrawString(&texts[1], 0x02, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x482));
		Text_InsertDrawString(&texts[2], 0x02, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x483));
		Text_InsertDrawString(&texts[1], 0x32, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x490));
		Text_InsertDrawString(&texts[2], 0x32, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x484));

		Text_InsertDrawNumberOrBlank(&texts[1], 0x24, color, gBattleActor.battleAttack);
		Text_InsertDrawNumberOrBlank(&texts[2], 0x24, color, gBattleActor.battleHitRate);
		Text_InsertDrawNumberOrBlank(&texts[1], 0x54, color, gBattleActor.battleCritRate);
		Text_InsertDrawNumberOrBlank(&texts[2], 0x54, color, gBattleActor.battleAvoidRate);

		PutText(&proc->text[0], TILEMAP_LOCATED(gBG0TilemapBuffer, proc->x + 1, proc->y + 0x1));
		PutText(&proc->text[1], TILEMAP_LOCATED(gBG0TilemapBuffer, proc->x + 1, proc->y + 0x3));
		PutText(&proc->text[2], TILEMAP_LOCATED(gBG0TilemapBuffer, proc->x + 1, proc->y + 0x5));

		DrawIcon(
			TILEMAP_LOCATED(bg_base, 7, 1),
			GetItemType(gBattleActor.weapon) + 0x70,
			icon_pal << 0xC);
		break;
	} /* switch item type */

	BG_EnableSyncByMask(BG0_SYNC_BIT);
}
