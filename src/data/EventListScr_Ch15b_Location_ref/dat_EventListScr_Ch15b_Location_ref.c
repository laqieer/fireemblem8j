#include "global.h"

#include "constants/items.h"
#include "eventscript.h"

/* JP chapter 15B location-based event list (region-different map content).
 * Reconstructed from the JP bytes using the EvtList* macros in eventscript.h;
 * byte-identical to the former INCBIN of EventListScr_Ch15b_Location.bin.
 *
 * The symbol is exactly 64 bytes and ends mid-record: the final word is the
 * header of a DOOR entry whose body continues in the adjacent data_08A5CEDC
 * residue, so it is emitted here as a raw EVT_LIST_CMD_DOOR header word to keep
 * the byte layout intact without absorbing the neighbouring symbol. */

SECTION(".rodata.dat_EventListScr_Ch15b_Location_ref") EventListScr EventListScr_Ch15b_Location[] = {
    EvtListTile(3, 1, 13, 3, 0x11)
    EvtListCHES(ITEM_AXE_TOMAHAWK, 3, 12)
    EvtListCHES(ITEM_BOOSTER_RES, 20, 1)
    EvtListCHES(ITEM_KNIGHTCREST, 20, 3)
    EvtListDOOR(1, 4, 0)

    /* DOOR header for the entry continued in data_08A5CEDC */
    _EvtParams2(EVT_LIST_CMD_DOOR, 0),
};
