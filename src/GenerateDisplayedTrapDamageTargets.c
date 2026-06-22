#include "global.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "uiselecttarget.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[TRAP_MAX_COUNT];
extern inline struct Trap* GetTrap(int id) {
    return sTrapPool + id;
}

void GenerateFireTileTrapTargets(int x, int y, int damage);
void GenerateArrowTrapTargets(int x, int y, int damage);
void GenerateGasTrapTargets(int x, int y, int damage, int facing);
s8 ShouldSkipGasTrapDisplay(int x, int y, int facing);

//! FE8U = 0x0802E7E0
void GenerateDisplayedTrapDamageTargets(void)
{
    struct Trap* trap;

    int specialType = 0;

    InitTargets(0, 0);

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if (trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
        {
            switch (trap->type)
            {

            case TRAP_FIRETILE:
                if (gBmMapUnit[trap->yPos][trap->xPos])
                {
                    AddTarget(trap->xPos, trap->yPos, 0, TRAP_FIRETILE);
                    GenerateFireTileTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                }

                break;

            case TRAP_GAS:
                switch (trap->extra)
                {

                case FACING_UP:
                    specialType = 0x64;
                    break;

                case FACING_DOWN:
                    specialType = 0x65;
                    break;

                case FACING_LEFT:
                    specialType = 0x66;
                    break;

                case FACING_RIGHT:
                    specialType = 0x67;
                    break;

                }

                if (!ShouldSkipGasTrapDisplay(trap->xPos, trap->yPos, trap->extra))
                {
                    AddTarget(trap->xPos, trap->yPos, 0, specialType);
                    GenerateGasTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE], trap->extra);
                }

                break;

            case TRAP_LIGHTARROW:
                AddTarget(trap->xPos, trap->yPos, 0, TRAP_LIGHTARROW);
                GenerateArrowTrapTargets(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_MAPCHANGE2:
                AddTarget(trap->extra ? trap->xPos : trap->yPos, TRAP_INDEX(trap), 0, trap->type);
                break;

            }
        }
    }
}
