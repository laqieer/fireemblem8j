#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"
#include "face.h"

extern struct FaceVramEntry sFaceConfig[];

//! FE8U = 0x080057C0
void FaceRefreshSprite(struct FaceProc* proc) {
    int oam2Layer;

    switch (proc->displayBits & 0x807) {
        case 0:
            proc->sprite = gSprite_Face64x96;
            break;

        case 1:
            proc->sprite = gSprite_Face64x96_Flipped;
            break;

        case 2:
            proc->sprite = gSprite_Face96x96;
            break;

        case 3:
            proc->sprite = gSprite_Face96x96_Flipped;
            break;

        case 4:
            proc->sprite = gSprite_Face80x72;
            break;

        case 5:
            proc->sprite = gSprite_Face80x72_Flipped;
            break;

        case 0x800:
            proc->sprite = gSprite_Face96x72;
            break;

        case 0x801:
            proc->sprite = gSprite_Face96x72_Flipped;
            break;
    }

    switch (proc->displayBits & FACE_DISP_HLAYER_MASK) {
        case FACE_DISP_HLAYER(FACE_HLAYER_0):
            oam2Layer = OAM2_LAYER(0);
            break;

        case FACE_DISP_HLAYER(FACE_HLAYER_1):
            oam2Layer = OAM2_LAYER(1);
            break;

        case FACE_DISP_HLAYER(FACE_HLAYER_3):
            oam2Layer = OAM2_LAYER(3);
            break;

        default:
            oam2Layer = OAM2_LAYER(2);
            break;
    }

    proc->oam2 = (sFaceConfig[proc->faceSlot].tileOffset / CHR_SIZE) + ((sFaceConfig[proc->faceSlot].paletteId & 0xF) * 0x1000) + oam2Layer;

    return;
}
