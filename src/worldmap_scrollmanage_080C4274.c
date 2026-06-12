#include "global.h"
#include "spline.h"
#include "worldmap.h"

bool CheckGmScrolling(void)
{
    return !(GM_MAIN->scrolling & 1);
}
