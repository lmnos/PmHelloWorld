//彭东 @ 2017.12.29

void _strwrite(char* string)
{
    char* p_strdst=(char*)(0xb8000);
    while(*string)
    {

        *p_strdst=*string++;
        p_strdst+=2;
    }
    return;
}

void printf(char* fmt,...)
{
    _strwrite(fmt);
    return;
}
