#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "opinfo.h"

void ClassIntroLetter_Init(struct OpInfoViewProc* proc) {
    proc->timer = 0;
    proc->unk_2e = ((struct OpInfoEnterProc*)(proc->proc_parent))->unk_2c + (proc->charIndex * 28);
    return;
}
