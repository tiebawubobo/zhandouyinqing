#include "defines.h"
#include "static_references.h"

u8 get_new_poke_ability(u16 poke, u8 bitID)
{ //0x6b694
    const u8* ability = &(*basestat_table)[poke].ability1;
    bitID = *(ability + bitID);
    last_used_ability = bitID;
    return bitID;
}