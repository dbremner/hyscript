#include <lua.h>
#include <lauxlib.h>
#include <windows.h>

BOOL APIENTRY DllMain(HANDLE module, DWORD reason, LPVOID reserved)
{
    return TRUE;
}

static int l_messagebox(lua_State * L) {
  const char * s = luaL_checkstring(L, 1);
  MessageBox(NULL, s, "messagebox", MB_OK);
  return 0;
}

__declspec(dllexport) int luaopen_helloc(lua_State * L) {
  lua_pushcfunction(L, l_messagebox);
  return 1;
}