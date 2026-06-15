#include "global.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "bmlib.h"
#include "bmmind.h"

void UpdatePathArrowWithCursor(void);
void DrawPathArrow(void);

void DrawUpdatedPathArrow(void) {
    UpdatePathArrowWithCursor();
    DrawPathArrow();
}
