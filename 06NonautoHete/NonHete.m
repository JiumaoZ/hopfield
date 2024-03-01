function dX = NonHete(t,u)
    global k a b c d
    dx1 = -u(1)+0.5*tanh(u(1))-3.5*G(u(2))+k*(u(3)-u(3)^3/6)*(u(1)-u(2))+a*sin(b*t);
    dx2 = -u(2)+5*tanh(u(1))+1.5*G(u(2))+k*(u(3)-u(3)^3/6)*(u(2)-u(1))+c*sin(d*t);
    dw = (u(1)-u(2))-u(3);

    dX = [dx1;dx2;dw];
end

function y = G(x)
    y = exp(-(x^2)/1);
end
