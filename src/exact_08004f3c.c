#include "global.h"

#include "hardware.h"

#include "anime.h"

 int  AnimInterpret(struct Anim* anim);
 void AnimInsert(struct Anim* anim);
 void AnimDisplayPrivate(struct Anim* anim);
 void Anim_0(struct Anim* anim, u32 instruction);

typedef void (*AnimCallback_t) (struct Anim* anim);




/* prototypes for same-file helpers called by this run */
void AnimDisplayPrivate(struct Anim* anim);

void AnimDisplay(struct Anim* anim)
{
    AnimDisplayPrivate(anim);
}
