#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

//! FE8U = 0x08069CDC
void efxDarkGradoOBJ02_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer < 88)
    {
        if ((proc->timer - 3 > 0) && (DivRem(proc->timer - 3, 6) == 0))
        {
            switch (proc->unk44)
            {
                case 0:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -64, -16, 0xa80, 98 - proc->timer);
                    break;

                case 1:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -128, -16, 0x780, 98 - proc->timer);
                    break;

                case 2:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, 0, -16, 0x900, 98 - proc->timer);
                    break;

                case 3:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -64, -16, 0x900, 98 - proc->timer);
                    break;

                case 4:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -128, -16, 0xa80, 98 - proc->timer);
                    break;

                case 5:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, 0, -16, 0x780, 98 - proc->timer);
                    break;
            }

            proc->unk44++;

            if (proc->unk44 == 6)
            {
                proc->unk44 = 0;
            }
        }

        if ((proc->timer - 1 > 0) && (DivRem(proc->timer - 1, 6) == 0))
        {
            switch (proc->unk48)
            {
                case 0:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -24, 0, 0x540, 98 - proc->timer);
                    break;

                case 1:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -56, 0, 0x3c0, 98 - proc->timer);
                    break;

                case 2:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -88, 0, 0x480, 98 - proc->timer);
                    break;

                case 3:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -24, 0, 0x480, 98 - proc->timer);
                    break;

                case 4:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -56, 0, 0x540, 98 - proc->timer);
                    break;

                case 5:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -88, 0, 0x3c0, 98 - proc->timer);
                    break;
            }

            proc->unk48++;

            if (proc->unk48 == 6)
            {
                proc->unk48 = 0;
            }
        }
    }

    if (proc->timer == 96)
    {
        Proc_Break(proc);
    }

    return;
}
