extern "C"
{
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}
#include <iostream>
#include <cassert>
#include <cstring>

void stackdump_g(lua_State* l)
{
    int i;
    int top = lua_gettop(l);

    printf(":::::total in stack %d\n",top);

    for (i = 1; i <= top; i++)
    {  /* repeat for each level */
        int t = lua_type(l, i);
        switch (t) {
            case LUA_TSTRING:  /* strings */
                printf(":::::string: '%s'\n", lua_tostring(l, i));
                break;
            case LUA_TBOOLEAN:  /* booleans */
                printf(":::::boolean %s\n",lua_toboolean(l, i) ? "true" : "false");
                break;
            case LUA_TNUMBER:  /* numbers */
                printf(":::::number: %g\n", lua_tonumber(l, i));
                break;
            default:  /* other values */
                printf("%s\n", lua_typename(l, t));
                break;
        }
        printf("  ");  /* put a separator */
    }
    printf("\n");  /* end the listing */
}

int main(int argc, char * argv[])
{
    int status;

    lua_State* global_state = lua_open();

    luaL_openlibs(global_state);

    /*  */
    lua_newtable(global_state);
    int idx = 0;
    FILE * fp = fopen("rule.pro", "r");
    assert(fp);
    char rule_buf[4096];
    char *fail_rule = "pack.Url = \"RULE_ERROR\"";
    while(fgets(rule_buf, 4096, fp) != NULL)
    {
        lua_pushnumber(global_state, idx++);
        status = luaL_loadbuffer(global_state, rule_buf, strlen(rule_buf), "null");
        if(status != 0) {
            puts(lua_tostring(global_state, -1));
            lua_pop(global_state, 1);
            assert(luaL_loadbuffer(global_state, fail_rule, strlen(fail_rule), "null") == 0);
        }
        lua_rawset(global_state, -3);
    }
    fclose(fp);

    lua_setglobal(global_state, "rules");

    lua_State* state = lua_newthread(global_state);
    assert(state);

    lua_newtable(state);
    ///// pack.a = 1
    lua_pushstring(state, "a");
    lua_pushnumber(state, 1);
    lua_settable(state, -3);
    ///// pack.b = 2
    lua_pushstring(state, "b");
    lua_pushnumber(state, 2);
    lua_settable(state, -3);
    lua_setglobal(state, "pack");

    lua_getglobal(state, "rules");
    int ruleId = 0; // 执行第0个规则
    lua_pushnumber(state, ruleId);
    lua_rawget(state, -2);

    if(lua_pcall(state, 0, 1, 0) != 0)
    {
        fprintf(stderr, "LUA_ERROR:%s\n", lua_tostring(state, -1));
        lua_pop(state, 1);
    }

    double rule_ret = (double)lua_tonumber(state, -1);
    fprintf (stdout, "Lua execute returns: %lf\n", rule_ret);
    lua_pop(state, 2);

    lua_close(global_state);
    return 0;
}
