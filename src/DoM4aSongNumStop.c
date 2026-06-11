#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void DoM4aSongNumStop(int songid)
{
    m4aSongNumStop(songid);
}
