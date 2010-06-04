#include <lua.h>
#include <lauxlib.h>
#include <windows.h>

BOOL APIENTRY DllMain(HANDLE module, DWORD reason, LPVOID reserved)
{
    return TRUE;
}

static int l_messagebox(lua_State * L)
{
    const char * s = luaL_checkstring(L, 1);
    MessageBox(NULL, s, "messagebox", MB_OK);
    return 0;
}

static int l_sayhello(lua_State * L)
{
    const char * s = luaL_checkstring(L, 1);
    MessageBox(NULL, s, "hello", MB_OK);
    return 0;
}

static int l_newtable(lua_State * L)
{
    lua_newtable(L);
    
    lua_pushstring(L, "user1");
    lua_pushstring(L, "Linda");
    lua_settable(L, -3);

    lua_pushstring(L, "ssss");
    lua_pushstring(L, "Linda2");
    lua_settable(L, -3);

    return 1;
}

static const struct luaL_reg helloc_lib[] = {
    {"messagebox",   l_messagebox},
    {"sayhello",   l_sayhello},
    {"newtable", l_newtable},
    {NULL, NULL}
};

__declspec(dllexport) int luaopen_helloc(lua_State * L)
{
    //lua_pushcfunction(L, l_messagebox);
    //lua_pushcfunction(L, l_sayhello);


    /* luaL_register(L, "helloc", helloc_lib); */
    luaL_openlib(L, "helloc", helloc_lib, 0);
    return 1;
}
