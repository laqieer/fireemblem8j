#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

/* prototypes for same-file helpers called by this run */
void EfxDracoZombiePrepareTSA(int x, int y, s8 pos);

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc)
{
    EfxDracoZombiePrepareTSA(0, 0, 0);

    /* banim index for Draco Zombie */
    EkrPrepareBanimfx(proc->anim, 0xC0);

    SetAnimStateUnHidden(GetAnimPosition(proc->anim));

    /* spell anim index maybe */
    gEkrSpellAnimIndex[0] = 0x15;
}
