#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"


struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 x;
    /* 66 */ s16 y;
    /* 68 */ u16 subcmd;
    /* 6A */ u16 timer;
};
struct ProcEventPromote
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * event_engine;

    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 lock;
};
int Get8(void);

u8 Event3D_MenuOverride(struct EventEngineProc * proc)
{
    u8 i;
    u16 bit;

    u8 UnitMenuOverrideConf[15] =
    {
        0x4F, /* 攻撃 */
        0x51, /* 杖 */
        0x6B, /* 待機 */
        0x63, /* 救出 */
        0x64, /* 降ろす */
        0x5C, /* 訪問 */
        0x5A, /* 話す */
        0x67, /* 持ち物 */
        0x37, /* 捨てる */
        0x68, /* 交換 */
        0x69, /* 輸送隊 */
        0x5B, /* 支援 */
        0x5F, /* 武器屋 */
        0x71, /* 設定 */
        0x78, /* 終了 */
    };

    u8 ItemMenuOverrideConf[5] =
    {
        0x49, /* unit->items[0] */
        0x4A, /* unit->items[1] */
        0x4B, /* unit->items[2] */
        0x4C, /* unit->items[3] */
        0x4D, /* unit->items[4] */
    };

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 flags = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ResetMenuOverrides();

    bit = 1;

    switch (subcmd) {
    case EVSUBCMD_DISABLEOPTIONS:
        for (i = 0; i < ARRAY_COUNT(UnitMenuOverrideConf); i++)
        {
            if (flags & bit)
                AddMenuOverride(UnitMenuOverrideConf[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);

            bit <<= 1;
        }
        break;

    case EVSUBCMD_DISABLEWEAPONS:
        for (i = 0; i < ARRAY_COUNT(ItemMenuOverrideConf); i++)
        {
            if (flags & bit)
            {
                AddMenuOverride(ItemMenuOverrideConf[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysDisabled);
                AddMenuOverride(ItemMenuOverrideConf[i], MENU_OVERRIDE_ONSELECT, Get8);
            }
            bit <<= 1;
        }
        break;

    case 2:
        break;
    }
    return EVC_ADVANCE_CONTINUE;
}
