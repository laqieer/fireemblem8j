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

s8 ShouldFaceBeRaised(int fid);
void PutFace80x72_Raised(u16 * tm, int tileref, const struct FaceData* info);

//! FE8U = 0x08005CA4
void PutFace80x72_Core(u16 * tm, int fid, int chr, int pal) {
    const struct FaceData* info;

    if (fid == 0) {
        return;
    }

    info = GetPortraitData(fid);

    ApplyPalette(info->pal, pal);

    if (info->img != 0) {
        int i;

        Decompress(info->img, (void *)(chr * 0x20 + VRAM));
        ApplyPalette(info->pal, pal);

        if (ShouldFaceBeRaised(fid) != 0) {
            PutFace80x72_Raised(tm, (pal << 12) + (0x3FF & chr), info);
        } else {
            PutFace80x72_Standard(tm, (pal << 12) + (0x3FF & chr), info);
        }

        for (i = 0; i < 5; i++) {
            tm[i * 0x20 + 0] = 0;
            tm[i * 0x20 + 9] = 0;
        }

    } else {
        Decompress(info->imgCard, (void*)(chr * CHR_SIZE + VRAM));
        PutAppliedBitmap(tm, (pal << 12) + (0x3FF & chr), 10, 9);
    }

    return;
}
