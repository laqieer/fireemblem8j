#include "global.h"
#include "constants/classes.h"
#include "bm.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "functions.h"

struct MuProc *Make6CMOVEUNITForUnitBeingRescued(struct Unit *unit);

struct KoidoProc {
    PROC_HEADER;

    /* 2C */ int direction;
    /* 30 */ struct Unit* unit;
    /* 34 */ struct MuProc* proc_mu;
    /* 38 */ u8 mu_commands[0x03];
    /* 3B */ u8 unk_3B;
    /* 3C */ s8 config;
};

extern struct ProcCmd sProcScr_KOIDO[];

static inline void Make6CKOIDO_common(struct Unit* unit, int config, struct KoidoProc *proc)
{
    struct MuProc *proc_mu;
    proc->config = config;

    proc_mu = Make6CMOVEUNITForUnitBeingRescued(unit);
    proc->proc_mu = proc_mu;
    SetMuMoveScript(proc_mu, proc->mu_commands);
}

void Make6CKOIDO(struct Unit* unit, int direction, int config, ProcPtr parent)
{
    struct KoidoProc *proc = Proc_StartBlocking(sProcScr_KOIDO, parent);

    proc->unit = unit;
    proc->direction = direction;
    proc->mu_commands[0] = MOVE_CMD_CAMERA_OFF;
    proc->mu_commands[1] = direction;
    proc->mu_commands[2] = MOVE_CMD_HALT;

    Make6CKOIDO_common(unit, config, proc);
}
