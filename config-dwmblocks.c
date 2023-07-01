#include "config.h"

#include "block.h"
#include "util.h"

#define BAR_SCRIPTS "$DWM_BAR/"

Block blocks[] = {
    //{ BAR_SCRIPTS "sb-mail",    600,  1 },
    //{ BAR_SCRIPTS "sb-music",   0,    2 },
    { BAR_SCRIPTS "sb-disk",    1800, 3 },
    { BAR_SCRIPTS "sb-memory",  10,   4 },
    { BAR_SCRIPTS "sb-cpu", 5,    5 },
    // { BAR_SCRIPTS "sb-mic",     0,    6 },
    //{ BAR_SCRIPTS "sb-record",  0,    7 },
    // { BAR_SCRIPTS "sb-volume",  0,    8 },
    { BAR_SCRIPTS "sb-battery", 5,    9 },
    { BAR_SCRIPTS "sb-date",    1,    10},
    { BAR_SCRIPTS "sb-powermenu", 0, 11 },
};

const unsigned short blockCount = LEN(blocks);
