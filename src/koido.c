#include "global.h"

#include "constants/classes.h"

#include "bm.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "functions.h"

struct KoidoProc {
    PROC_HEADER;

    /* 2C */ int direction;
    /* 30 */ struct Unit* unit;
    /* 34 */ struct MuProc* proc_mu;
    /* 38 */ u8 mu_commands[0x03];
    /* 3B */ u8 unk_3B;
    /* 3C */ s8 config;
};

void Loop6C_KOIDO(struct KoidoProc* proc);





int GetSomeFacingDirection(int x0, int y0, int x1, int y1)
{
    if (x0 == x1) {
        if (y0 < y1)
            return FACING_UP;
        else if (y0 > y1)
            return FACING_DOWN;
    }

    if (y0 != y1)
        return FACING_LEFT;
    
    if (x0 < x1)
        return FACING_LEFT;
    
    if (x0 <= x1)
        return FACING_LEFT;
    
    return FACING_RIGHT;
}

struct MuProc* Make6CMOVEUNITForUnitBeingRescued(struct Unit* unit)
{
    const u32 attributes = UNIT_CATTRIBUTES(unit);

    if (!(CA_MOUNTEDAID & attributes))
        return StartMu(unit);
    else
        return (CA_FEMALE & attributes)
            ? StartMuExt(unit, CLASS_CIVILIAN_F2,0xC)
            : StartMuExt(unit, CLASS_CIVILIAN_M2,0xC);
}

void Loop6C_KOIDO(struct KoidoProc* proc)
{
    if (MuExistsActive())
        return;
    
    if (2 != proc->config)
        EndMu(proc->proc_mu);
    
    Proc_Break(proc);

    if (1 == proc->config) {
        RefreshEntityBmMaps();
        RefreshUnitSprites();
        ForceSyncUnitSpriteSheet();
    }
}
