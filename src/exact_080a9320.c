#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
void PidStatsAddFavval(u8 pid, int val);

void PidStatsSubFavval08(u8 pid)
{
    PidStatsAddFavval(pid, -0x08);
}
