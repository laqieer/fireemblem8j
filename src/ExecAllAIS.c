#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805A9F4
void ExecAllAIS(void)
{
    AnimUpdateAll();
    return;
}
