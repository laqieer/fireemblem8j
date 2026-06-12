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

//! FE8U = 0x08005924
void UnpackFaceChibiGraphics(int fid, int chr, int pal) {
    if (fid >= FID_FACTION_CHIBI) {
        RegisterDataMove(GetGenericChibiImg(fid), (void *)(((chr * CHR_SIZE + VRAM) & 0x1FFFF) + VRAM), 0x200);
        ApplyGenericChibiPal(fid, pal);
    } else {
        const struct FaceData* info = GetPortraitData(fid);

        Decompress(info->imgChibi, (void *)(chr * CHR_SIZE + VRAM));
        ApplyPalette(info->pal, pal);
    }
    return;
}
