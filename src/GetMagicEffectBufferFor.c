#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

//! FE8U = 0x0806E954
struct AnimMagicFxBuffer * GetMagicEffectBufferFor(struct Anim * anim)
{
    return ((struct AnimBuffer *)(anim->pUnk44))->unk_30;
}
