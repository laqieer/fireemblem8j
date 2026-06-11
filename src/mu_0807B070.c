#include "global.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"
/* TU-private data externs bound at their JP addresses */
extern short sMoveOffsetLut[];
extern MuStateFunc sMuStateFuncs[];

u16 GetMuQ4MovementSpeed(struct MuProc * proc);
void PutMu(struct MuProc * proc);

void Mu_OnStateDoNothing(struct MuProc * proc) {}

void Mu_OnStateMovement(struct MuProc * proc)
{
    unsigned moveSpeed = GetMuQ4MovementSpeed(proc);

    proc->move_clock_q4 = moveSpeed + proc->move_clock_q4;

    proc->x_q4 += moveSpeed * sMoveOffsetLut[proc->facing * 2 + 0];
    proc->y_q4 += moveSpeed * sMoveOffsetLut[proc->facing * 2 + 1];

    if ((proc->move_clock_q4 / 16) >= 16)
    {
        proc->move_clock_q4 -= 0x100;

        proc->x_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 0];
        proc->y_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 1];

        proc->move_clock_q4 = 0;

        proc->x_q4 &= ~0xF;
        proc->y_q4 &= ~0xF;
    }

    if (proc->cam_b && !Proc_Find(ProcScr_CamMove))
    {
        gBmSt.camera.x = GetCameraAdjustedX(proc->x_q4 >> MU_SUBPIXEL_PRECISION);
        gBmSt.camera.y = GetCameraAdjustedY(proc->y_q4 >> MU_SUBPIXEL_PRECISION);
    }

    if (!(proc->moveConfig & MU_CONFIG_SPPED_NORMAL))
        UpdateMuStepSounds(proc);
}

void UpdateMuStepSounds(struct MuProc * proc)
{
    const u16 * scr;

    int pc;
    struct Vec2 position;

    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
    {
        switch (proc->jid) {
        case CLASS_WYVERN_RIDER:
        case CLASS_WYVERN_RIDER_F:
        case CLASS_WYVERN_LORD:
        case CLASS_WYVERN_LORD_F:
        case CLASS_WYVERN_KNIGHT:
        case CLASS_WYVERN_KNIGHT_F:
            scr = MuSoundScr_Wyvern;
            break;

        case CLASS_MOGALL:
        case CLASS_ARCH_MOGALL:
            scr = MuSoundScr_Mogall;
            break;

        case CLASS_PEGASUS_KNIGHT:
        case CLASS_FALCON_KNIGHT:
            scr = MuSoundScr_Pegasus;
            break;

        default: // Any other mounted class
            scr = MuSoundScr_Mounted;
            break;
        }
    }
    else
    {
        switch (proc->jid) {
        case CLASS_REVENANT:
        case CLASS_ENTOUMBED:
            scr = MuSoundScr_Zombie;
            break;

        case CLASS_BONEWALKER:
        case CLASS_BONEWALKER_BOW:
        case CLASS_WIGHT:
        case CLASS_WIGHT_BOW:
            scr = MuSoundScr_Skeleton;
            break;

        case CLASS_BAEL:
        case CLASS_ELDER_BAEL:
            scr = MuSoundScr_Spider;
            break;

        case CLASS_MAUTHEDOOG:
        case CLASS_GWYLLGI:
            scr = MuSoundScr_Dog;
            break;

        case CLASS_TARVOS:
        case CLASS_MAELDUIN:
            scr = MuSoundScr_Mounted;
            break;

        case CLASS_MOGALL:
        case CLASS_ARCH_MOGALL:
            scr = MuSoundScr_Mogall;
            break;

        case CLASS_GORGON:
            scr = MuSoundScr_Gorgon;
            break;

        case CLASS_GARGOYLE:
        case CLASS_DEATHGOYLE:
            scr = MuSoundScr_Wyvern;
            break;

        case CLASS_ARMOR_KNIGHT:
        case CLASS_ARMOR_KNIGHT_F:
        case CLASS_GENERAL:
        case CLASS_GENERAL_F:
        case CLASS_MANAKETE_2:
        case CLASS_CYCLOPS:
        case CLASS_DRACO_ZOMBIE:
        case CLASS_DEMON_KING:
        case CLASS_BLST_REGULAR_USED:
        case CLASS_BLST_LONG_USED:
        case CLASS_BLST_KILLER_USED:
            scr = MuSoundScr_FootHeavy;
            break;

        case CLASS_FLEET:
            scr = MuSoundScr_Boat;
            break;

        case CLASS_MANAKETE_MYRRH:
            scr = MuSoundScr_Myrrh;
            break;

        case CLASS_FALLEN_PRINCE:
        case CLASS_FALLEN_PEER:
            return; // no sounds

        default: // Any other non-mounted class
            scr = MuSoundScr_Foot;
            break;

        } // switch (proc->jid)
    }

    pc = DivRem(proc->step_sound_clock++, scr[0]);
    GetMuDisplayPosition(proc, &position);

    if (scr[2 + pc])
        StartPlayMuStepSe(scr[2 + pc], scr[1], position.x);
}

void Mu_OnLoop(struct MuProc * proc)
{
    if (proc->state)
    {
        if (proc->move_clock_q4 == 0)
            if (proc->state == MU_STATE_SLEEPING || proc->state == MU_STATE_MOVEMENT)
                RunMuMoveScript(proc);

        sMuStateFuncs[proc->state](proc);
    }

    if (proc->facing == MU_FACING_STANDING)
        PutMuSMS(proc);
    else
        PutMu(proc);
}
