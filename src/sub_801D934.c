#include "global.h"

#include "proc.h"
#include "mu.h"
#include "bmunit.h"
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

extern struct ProcCmd sProcScr_KOIDOAMM[];
struct MuProc * Make6CMOVEUNITForUnitBeingRescued(struct Unit * unit);

static inline void Make6CKOIDO_common(struct Unit* unit, int config, struct KoidoProc *proc)
{
    struct MuProc *proc_mu;
    proc->config = config;
    proc_mu = Make6CMOVEUNITForUnitBeingRescued(unit);
    proc->proc_mu = proc_mu;
    SetMuMoveScript(proc_mu, proc->mu_commands);
}


void Make6CKOIDOAMM(struct Unit* unit, int direction)
{
    struct KoidoProc *proc = Proc_Start(sProcScr_KOIDOAMM, PROC_TREE_3);

    proc->unit = unit;
    proc->direction = direction;
    proc->mu_commands[0] = MOVE_CMD_CAMERA_OFF;
    proc->mu_commands[1] = direction;
    proc->mu_commands[2] = MOVE_CMD_HALT;

    Make6CKOIDO_common(unit, 0, proc);
}
