-module(user_default).
-compile(export_all).

-spec all_modules() -> module().
all_modules() ->
  [ list_to_atom(
      re:replace(
        filename:basename(F), "[.]beam$", "", [{return, list}]))
    ||  P <- code:get_path(),
        string:str(P, code:lib_dir()) == 0,
        F <- filelib:wildcard(filename:join(P, "*.beam"))].

-spec all_behaviours() -> module().
all_behaviours() ->
  [{B,F,A} || M <- all_modules(),
              B <- proplists:get_value(
                    behaviour, M:module_info(attributes),
                    proplists:get_value(behavior, M:module_info(attributes), [])),
              {F,A} <- B:behaviour_info(callbacks)].

-spec is_behaviour_callback(module(), function(), integer(), [tuple()]) -> boolean().
is_behaviour_callback(M,F,A,BFAs) ->
  case proplists:get_value(
          behaviour, M:module_info(attributes),
          proplists:get_value(behavior, M:module_info(attributes), [])) of
    [] -> false;
    [B] -> lists:member({B,F,A}, BFAs)
  end.

mk() -> up_to_date = make:all([load]).

inc(X) -> X + 1.
dec(X) -> X - 1.
