#include "global.h"

#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "eventinfo.h"
#include "eventcall.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! FE8U = 0x0808639C
void StartAvailableTileEvent(s8 xArg, s8 yArg) {
    struct EventInfo info;
    int x = xArg;
    int y = yArg;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (SearchAvailableEvent(&info) == NULL) {
        return;
    }

    switch (info.commandId) {
        case TILE_COMMAND_VISIT:
            gBmMapUnit[y][x] = gActiveUnit->pCharacterData->number;

            // fallthrough

        case TILE_COMMAND_SEIZE:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            ClearActiveEventRegistry();
            StartEventFromInfo(&info, EV_EXEC_CUTSCENE);

            if (info.givenMoney == 3) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
            }

            return;

        case TILE_COMMAND_20:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            CallTileChangeEvent(GetMapChangeIdAt(info.xPos,info.yPos));

            return;

        case TILE_COMMAND_DOOR:
        case TILE_COMMAND_BRIDGE:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            if (info.script == 1) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
                SetFlag(info.flag);
            } else {
                ClearActiveEventRegistry();
                StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
            }

            return;

        case TILE_COMMAND_CHEST:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            if (info.givenItem == 0) {
                u8 b;
                u8 rand = NextRN_100();
                u8* ptr = (u8*)(info.script);
                u8 r0;

                r0 = ptr[0];
                if (r0 != 0) {

                    b = ptr[1];
                    if (rand >= b) {
                        for (; rand >= b; b += ptr[1]) {
                            ptr+=2;
                            if (ptr[0] == 0) {
                                goto _08084274;
                            }
                        }
                        r0 = ptr[0];
                    }

                    info.givenItem = r0;
                }
            _08084274:
                info.givenItem = GetChestItemSubstitute(info.givenItem);
                CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenItem);
            } else {
                if (info.givenItem != ITEM_GOLD) {
                    info.givenItem = GetChestItemSubstitute(info.givenItem);
                    CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenItem);
                } else {
                    CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenMoney);
                }
            }

            SetFlag(info.flag);

            return;

        case TILE_COMMAND_ARMORY:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            StartArmoryScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_VENDOR:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }
            StartVendorScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_SECRET:
            if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
                return;
            }

            StartSecretShopScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

#if !NONMATCHING
        case TILE_COMMAND_SHOP_UNK:
            asm("nop");
            return;

        case TILE_COMMAND_NONE:
            asm("nop");
            return;
#endif
    }

    return;
}
