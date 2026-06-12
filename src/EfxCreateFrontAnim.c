#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

struct Anim * EfxCreateFrontAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4)
{
    struct Anim * anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr2, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAnimPosition(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr3, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}
