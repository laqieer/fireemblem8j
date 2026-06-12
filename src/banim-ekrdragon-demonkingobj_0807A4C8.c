#include "gbafe.h"



void EfxSelfThunderBGUpdateAnimTSA(struct Anim *anim, const u16 *tsa_close, const u16 *tsa_far)
{
    u16 *buffer;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(tsa_close, gEkrTsaBuffer);
    else
        LZ77UnCompWram(tsa_far, gEkrTsaBuffer);

    buffer = gEkrTsaBuffer;
    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBG(buffer, gBG1TilemapBuffer, 32, 20, 1, 256);
    else
        EfxTmCpyBgHFlip(buffer, gBG1TilemapBuffer, 32, 20, 1, 256);
    
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}
