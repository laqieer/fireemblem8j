#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

extern s16 gEfxmagicGleipnir_0[];
extern s16 gEfxmagicGleipnir_1[];
extern s16 gEfxmagicGleipnir_2[];
extern s16 gEfxmagicGleipnir_3[];
extern s16 gEfxmagicGleipnir_4[];
extern s16 gEfxmagicGleipnir_5[];
extern s16 gEfxmagicGleipnir_6[];

//! FE8U = 0x0806977C
int efxDarkGradoGetPieceY(int a, int b, int c)
{
    s16 * ptr;

    switch (b)
    {
        case 0:
            ptr = gEfxmagicGleipnir_0;
            break;

        case 1:
            ptr = gEfxmagicGleipnir_1;
            break;

        case 2:
            ptr = gEfxmagicGleipnir_2;
            break;

        case 3:
            ptr = gEfxmagicGleipnir_3;
            break;

        case 4:
            ptr = gEfxmagicGleipnir_4;
            break;

        case 5:
            ptr = gEfxmagicGleipnir_5;
            break;

        default:
            ptr = gEfxmagicGleipnir_6;
            break;
    }

    return (ptr[a * 2 + 1] * c) >> 8;
}
