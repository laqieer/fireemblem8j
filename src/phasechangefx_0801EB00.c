#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"
#include "constants/songs.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */

u16 CONST_DATA obj_Phasechangefx_0[] =
{
    5,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32, 0,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_32x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x32 + OAM1_X(192), OAM2_CHR(0x18),
    OAM0_SHAPE_16x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x32 + OAM1_X(224), OAM2_CHR(0x1C),
};











void PhaseIntroUnk_Loop(struct PhaseIntroSubProc *proc)
{
    int val;

    switch (proc->stat_index) {
    case 0:
        val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0x100, proc->timer, 0xF);
        
        if (proc->timer > 0xE) {
            proc->timer = 0;
            proc->stat_index++;
        } else {
            proc->timer++;
        }
        break;

    case 1:
        val = 0x100;

        if (proc->timer <= 0x1D) {
            proc->timer++;
        } else {
            proc->timer = 0;
            proc->stat_index++;
        }
        break;

    case 2:
        val = Interpolate(INTERPOLATE_CUBIC, 0x100, 0x10, proc->timer, 0xF);

        if (proc->timer <= 0xE)
            proc->timer++;
        else
            Proc_Break(proc);
        break;
    
    default:
        break;
    }

    SetObjAffine(
        0,
        Div(COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val),
        Div(SIN(0) * 0x10, 0x100),
        Div(COS(0) * 0x10, val)
    );

    PutSpriteExt(
        2, 0, 0x44,
        obj_Phasechangefx_0,
        0x2600
    );
}
