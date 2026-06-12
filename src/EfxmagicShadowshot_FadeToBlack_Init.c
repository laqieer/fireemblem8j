#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

struct Proc085D8AEC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x0806B33C
void EfxmagicShadowshot_FadeToBlack_Init(struct Proc085D8AEC * proc)
{
    proc->unk4C = 0;
    return;
}
