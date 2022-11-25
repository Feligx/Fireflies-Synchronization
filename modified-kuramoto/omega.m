function func = omega(t)
    func = [];
    if t >18 && t<=24
        func = [func, 1/(4*sqrt(2*pi))*exp(-(t-24)^2/4)];
    else
        func = [func, 1/(4*sqrt(2*pi))*exp(-(t)^2/4)];
    end
    func = func*13;
end
