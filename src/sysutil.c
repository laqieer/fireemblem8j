

char * AppendCharacter(int character, char * str)
{
    *str = character;
    str++;
    *str = '\0';
    return str;
}
