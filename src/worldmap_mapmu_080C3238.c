#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 gWorldmapMapmu_5[];
extern u16 gWorldmapMapmu_6[];
extern u16 gWorldmapMapmu_4[];
extern u16 gWorldmapMapmu_3[];
extern u16 gWorldmapMapmu_7[];
extern u16 gWorldmapMapmu_2[];

extern struct Struct02003BE8 gUnk_15[];

extern u16 gUnk_13[];
extern int gUnk_14[];





/* prototypes for same-file helpers called by this run */
void GmMu_SetUnit(struct GMapMuProc * muProc, int index, u8 useClass, int id, int faction, int nodeId);

//! FE8U = 0x080BE44C
s8 GmUnitFadeExists(void)
{
    return (GetGmapUnitFade() != 0) ? 1 : 0;
}

//! FE8U = 0x080BE45C
void GmMuPrim_PlayStepSfx(struct GMapMuPrimProc * proc)
{
    int divRem;
    u16 * sfxLut;
    int hPos;
    int tmp;

    int jid = MapUnitC_GetDisplayedClass(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);

    if (GetClassData(jid)->attributes & 1)
    {
        switch (jid)
        {
            case CLASS_PEGASUS_KNIGHT:
            case CLASS_FALCON_KNIGHT:
                sfxLut = gWorldmapMapmu_6;
                break;

            case CLASS_WYVERN_RIDER:
            case CLASS_WYVERN_RIDER_F:
            case CLASS_WYVERN_LORD:
            case CLASS_WYVERN_LORD_F:
            case CLASS_WYVERN_KNIGHT:
            case CLASS_WYVERN_KNIGHT_F:
                sfxLut = gWorldmapMapmu_5;
                break;

            default:
                sfxLut = gWorldmapMapmu_4;
                break;
        }
    }
    else
    {
        switch (jid)
        {
            case CLASS_ARMOR_KNIGHT:
            case CLASS_ARMOR_KNIGHT_F:
            case CLASS_GENERAL:
            case CLASS_GENERAL_F:
            case CLASS_MANAKETE_2:
            case CLASS_MANAKETE_MYRRH:
            case CLASS_DRACO_ZOMBIE:
            case CLASS_BLST_REGULAR_USED:
            case CLASS_BLST_LONG_USED:
            case CLASS_BLST_KILLER_USED:
                sfxLut = gWorldmapMapmu_3;
                break;

            case CLASS_FLEET:
                sfxLut = gWorldmapMapmu_7;
                break;

            default:
                sfxLut = gWorldmapMapmu_2;
                break;
        }
    }

    divRem = DivRem((tmp = (proc->unk_30++)), sfxLut[0]);

    hPos = (hPos & 0xFFFF0000);
    hPos |= 0x78;
    hPos &= 0xFFFF;
    hPos |= 0x500000;

    if (sfxLut[divRem + 2] != 0)
    {
        StartPlayMuStepSe(sfxLut[divRem + 2], sfxLut[1], (s16)hPos);
    }

    return;
}

//! FE8U = 0x080BE534
void MapMU_SetUnitClass(ProcPtr muProc, int index, int jid, int faction, int nodeId)
{
    GmMu_SetUnit(muProc, index, 1, jid, faction, nodeId);
    return;
}

//! FE8U = 0x080BE550
void MapMU_SetUnitChar(ProcPtr muProc, int index, int pid, int faction, int nodeId)
{
    GmMu_SetUnit(muProc, index, 0, pid, faction, nodeId);
    return;
}
