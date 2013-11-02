-module(n2o_mq).
-include_lib("n2o/include/wf.hrl").
-export(?MESSAGE_API).

send(Pool, Message) -> gproc:send({p,l,Pool},Message).
reg(Pool) -> reg(Pool,undefined).
reg(Pool, Value) -> 
    Ctx = get({pool,Pool}),
    case Ctx of
         undefined -> gproc:reg({p,l,Pool},Value), put({pool,Pool},Pool);
         Defined -> skip end.
