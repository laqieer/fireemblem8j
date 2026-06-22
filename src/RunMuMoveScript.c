#include "global.h"

#include "bm.h"
#include "bmunit.h"
#include "mapanim.h"
#include "mu.h"

void RunMuMoveScript(struct MuProc * proc)
{
    while (true)
    {
        int command = proc->config->movescr[proc->config->pc++];

        switch (command) {
        case MOVE_CMD_SLEEP:
            proc->move_clock_q4 = proc->config->movescr[proc->config->pc++];
            proc->state = MU_STATE_SLEEPING;
            return;

        case MOVE_CMD_BUMP:
            EndMuMovement(proc);
            proc->state = MU_STATE_BUMPING;
            StartMuFogBump(
                (proc->x_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x,
                (proc->y_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y
            );
            return;

        case MOVE_CMD_HALT:
            HaltMu(proc);
            return;

        case MOVE_CMD_END:
            EndMuMovement(proc);
            EndMu(proc);
            return;

        case MOVE_CMD_MOVE_LEFT:
        case MOVE_CMD_MOVE_RIGHT:
        case MOVE_CMD_MOVE_DOWN:
        case MOVE_CMD_MOVE_UP:
            command = command - MOVE_CMD_MOVE_BASE;
            if (command != proc->facing)
            {
                GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command - MOVE_CMD_MOVE_BASE);
                proc->state = MU_STATE_MOVEMENT;
            }
            return;

        case MOVE_CMD_FACE_LEFT:
        case MOVE_CMD_FACE_RIGHT:
        case MOVE_CMD_FACE_DOWN:
        case MOVE_CMD_FACE_UP:
            command = (s16)(command - MOVE_CMD_FACE_BASE);
            if (command != proc->facing)
            {
                GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command);
            }

            break;

        case MOVE_CMD_SET_SPEED:
            proc->moveConfig = proc->config->movescr[proc->config->pc++];
            break;

        case MOVE_CMD_CAMERA_ON:
            EnableMuCamera(proc);
            break;

        case MOVE_CMD_CAMERA_OFF:
            DisableMuCamera(proc);
            break;

        } /* switch (command) */
    } /* while (true) */
}
