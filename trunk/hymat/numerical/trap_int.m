% 梯形法求积分

F1 = @(x)sin(x).*exp(x);
quad(F1, 1, 2);
quad8(F1, 1, 2);

F2 = @(x)(sin(x).^2)./(cos(x)+1.25);
quad(F2, 0, 2);
quad8(F2, 0, 2);

xx=zeros(20);
yy=zeros(20);

for i = 1:20
  xx(i) = 1 + i/20;
  yy(i) = quad(F1, 1, xx(i));
end

plot(xx, yy, 'r', 'linewidth', 3);

axis([1 2 0 5]);

pause;

for i = 1:20
  xx(i) = 1 + i/20;
  yy(i) = quad(F2, 1, xx(i));
end

plot(xx, yy, 'r', 'linewidth', 3);
axis([1 2 0 1]);
