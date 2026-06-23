#include "global.h"
#include "proc.h"
#include "sio.h"

void Tactician_MoveHand(struct ProcTactician * proc, int pos, const struct TacticianTextConf * conf)
{
    int str_idx;
    s16 adj_idx;
    const struct TacticianTextConf * adj_conf;

    adj_idx  = conf->adj_idx[pos];
    adj_conf = gTacticianTextConf + conf->adj_idx[pos];

    str_idx = proc->line_idx * 3;

    while (*adj_conf->str[str_idx] == '\0')
    {
        adj_idx  = adj_conf->adj_idx[pos];
        adj_conf = gTacticianTextConf + adj_conf->adj_idx[pos];
    }
    proc->conf_idx = adj_idx;
}
