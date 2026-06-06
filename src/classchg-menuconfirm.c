#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "hardware.h"
#include "sysutil.h"

int PromoSubConfirm_OnEnd(struct MenuProc *proc)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), 0xA, 6, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 8, 4), 0xA, 6, 0);
    SetTextFont(&gFontClassChg);
    ResetMenuTextCursors(proc->proc_parent);
    RedrawMenu(proc->proc_parent);
    SyncMenuBgs(proc);
    return 0;
}

u8 PromoSubConfirmMenuOnSelect(struct MenuProc *proc, struct MenuItemProc *b)
{
    if (b->itemNumber == 0) {
        ProcPtr found;
        EndMenu(proc);
        EndMenu(proc->proc_parent);
        found = Proc_Find(ProcScr_PromoMain);

        EndAllProcChildren(found);
        ClassChgLoadEfxTerrain();
        Proc_Goto(found, PROMOMAIN_LABEL_POST_SEL);
    }
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 ClassChgMenuSel_OnBPress(struct MenuProc *_proc, struct MenuItemProc *_proc2)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}
