#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void EfxTeonoSeCallBack(struct ProcEfxMagicOBJ * proc)
{
    gEfxBgSemaphore--;
}
