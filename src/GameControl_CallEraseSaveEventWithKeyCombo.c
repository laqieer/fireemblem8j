#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "gamecontrol.h"

void GameControl_CallEraseSaveEventWithKeyCombo(ProcPtr proc)
{
    if (gKeyStatusPtr->heldKeys == (L_BUTTON | DPAD_RIGHT | SELECT_BUTTON))
        Proc_Goto(proc, LGAMECTRL_EXEC_ENDING_SCENE);
}
