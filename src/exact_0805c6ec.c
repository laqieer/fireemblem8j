#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"







/* prototypes for same-file helpers called by this run */
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);

void NewEfxRestWINH_(struct Anim *anim, int a, int b)
{
    NewEfxRestWINH(anim, a, 0, b);
}
