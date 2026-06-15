#include "global.h"
#include "variables.h"
#include "functions.h"
#include "proc.h"
#include "event.h"

void SetKeyStatus_IgnoreMask(int a);

void UnsetKeyIgnoreMask(void)
{
    SetKeyStatus_IgnoreMask(0);
}
