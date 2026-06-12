#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

extern EWRAM_OVERLAY(banim) int gEkrTriangleInvalid;

/* prototypes for same-file helpers called by this run */
ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2);
ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2);

void EkrTriangleMain(struct ProcEkrTriangle * proc)
{
    int jid, jid1, jid2, wpn_type;
    int etype2;
    int ewtype1;
    int ewtype2;
    int etype1;
    struct Unit *unit;
    u16 wpn;
    s32 nine = 9;

    etype1 = 0;
    etype2 = 0;
    ewtype1 = 0;
    ewtype2 = 0;

    jid = (GetAnimPosition(proc->anim) == EKR_POS_L) 
        ? gpEkrBattleUnitLeft->unit.pClassData->number
        : gpEkrBattleUnitRight->unit.pClassData->number; 

    if (jid >= nine) {
        if (jid <= 0xC) {
            unit = gpEkrTriangleUnits[0];
            jid1 = unit->pClassData->number;
            if (jid1 == CLASS_ARMOR_KNIGHT)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == CLASS_ARMOR_KNIGHT_F)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == CLASS_GENERAL)
                etype1 = EKR_TRI_JTYPE_PROMOTED;
            if (jid1 == CLASS_GENERAL_F)
                etype1 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype1 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype1 = GetItemIndex(wpn) == ITEM_AXE_HANDAXE
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;

            default:
                break;
            }

            unit = gpEkrTriangleUnits[1];
            jid2 = unit->pClassData->number;
            if (jid2 == CLASS_ARMOR_KNIGHT)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == CLASS_ARMOR_KNIGHT_F)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == CLASS_GENERAL)
                etype2 = EKR_TRI_JTYPE_PROMOTED;
            if (jid2 == CLASS_GENERAL_F)
                etype2 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype2 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype2 = GetItemIndex(wpn) == ITEM_AXE_HANDAXE
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;
                break;

            default:
                break;
            }

            NewEkrTriArmorKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

            if (GetItemIndex(gpEkrBattleUnitRight->weaponBefore) == ITEM_AXE_HANDAXE)
                gEkrTriangleInvalid = false;
            else
                gEkrTriangleInvalid = true;
            goto proc_break;
        }
    }

    unit = gpEkrTriangleUnits[0];
    jid1 = unit->pClassData->number;
    if (jid1 == CLASS_PEGASUS_KNIGHT)
        etype1 = EKR_TRI_JTYPE_DEFAULT;
    if (jid1 == CLASS_FALCON_KNIGHT)
        etype1 = EKR_TRI_JTYPE_PROMOTED;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype1 = EKR_TRI_WTYPE_DEFAULT;
        break;

    case ITYPE_SWORD:
        ewtype1 = EKR_TRI_WTYPE_ALTERNATIVE;
        break;

    default:
        break;
    }

    unit = gpEkrTriangleUnits[1];
    jid2 = unit->pClassData->number;
    if (jid2 == CLASS_PEGASUS_KNIGHT)
        etype2 = 0;
    if (jid2 == CLASS_FALCON_KNIGHT)
        etype2 = 1;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype2 = 0;
        break;

    case ITYPE_SWORD:
        ewtype2 = 1;
        break;
    }

    NewEkrTriPegasusKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

    if (jid == CLASS_PEGASUS_KNIGHT)
        gEkrTriangleInvalid = false;
    else
        gEkrTriangleInvalid = true;
proc_break:
    Proc_Break(proc);
}
