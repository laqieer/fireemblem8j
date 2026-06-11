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
extern u8 sMuWalkSpeedLut[];

void PutMuSMS(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;

        if (!GetMuDisplayPosition(proc, &pos))
            return;

        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);

        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;

        SetStandingMuFacingFast(
            proc->slot,
            proc->pGfxVRAM
        );

        PutStandingMuSprite(
            proc->sprite_anim->objLayer,

            pos.x - 8,
            pos.y - 16,

            ((((unsigned)(proc->pGfxVRAM - OBJ_VRAM0) & 0x1FFFF) >> 5)
                | ((proc->config->pal & 0xF) << 12))
                + proc->layer,

            proc->jid,
            proc->slot
        );
    }
}

void PutMu(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;

        if (!GetMuDisplayPosition(proc, &pos))
            return;

        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);

        if (proc->state != MU_STATE_DISPLAY_UI)
            if (proc->unit && UNIT_FACTION(proc->unit) == FACTION_RED)
                if (gPlaySt.chapterVisionRange != 0)
                    if (gBmMapFog[MU_GetDisplayYOrg(proc) >> 4][MU_GetDisplayXOrg(proc) >> 4] == 0)
                        return; // whew

        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;

        AP_Update(proc->sprite_anim, pos.x, pos.y);
    }
}

u16 GetMuQ4MovementSpeed(struct MuProc * proc)
{
    int config = proc->moveConfig;

    if (config & 0x80)
        config += 0x80; // I don't really get that one

    if (proc->fast_walk_b)
        return 0x100;

    if (config != 0x40)
    {
        if (config != 0x00)
        {
            int speed = config;

            if (speed & 0x40)
                speed ^= 0x40;
            else if (gPlaySt.config.gameSpeed || (gKeyStatusPtr->heldKeys & A_BUTTON))
                speed *= 4;

            if (speed > 0x80)
                speed = 0x80;

            return speed;
        }

        if (!IsFirstPlaythrough() && (gKeyStatusPtr->heldKeys & A_BUTTON))
            return 0x80;

        if (gPlaySt.config.gameSpeed)
            return 0x40;
    }

    return 16 * sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking];
}
