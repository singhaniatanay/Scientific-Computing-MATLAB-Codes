syms x
ezplot(tan(x))
fn=taylor(tan(x),x,'ExpansionPoint',1,'order',10);
hold on;
ezplot(fn);
legend('tanx','taylor series')
