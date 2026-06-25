#include "global.h"
#include "bmpatharrowdisp.h"

// JP 0x08032CBC (sub_8032CBC) = PathContainsNoCycle.
// Verbatim port of fe8u bmpatharrowdisp.c PathContainsNoCycle: scans the
// path-arrow proc's pathX[]/pathY[] arrays (via gpPathArrowProc) for any
// duplicate (x,y) point; returns 0 if a cycle is found, 1 otherwise.
bool8 PathContainsNoCycle(void)
{
    s8 i, j;
    for (i = gpPathArrowProc->pathLen; i > 0; --i) {
        for (j = i - 1; j >= 0; --j) {
            if (gpPathArrowProc->pathX[i] == gpPathArrowProc->pathX[j] &&
                gpPathArrowProc->pathY[i] == gpPathArrowProc->pathY[j])
            {
                return 0;
            }
        }
    }

    return 1;
}
