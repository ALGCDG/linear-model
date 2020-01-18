classdef linear
    properties
        coefficients;
        bias;
        learning_rate;
        dim;
    end
    methods
        function obj = linear(dim_in, learning_rate_in)
            obj.dim = dim_in;
            obj.coefficients = rand(dim_in, 1);
            obj.learning_rate = learning_rate_in;
	    obj.bias = rand();
        end
        function y = forward(obj, x)
            y = x * obj.coefficients + obj.bias;
        end
        function cost_function = backward(obj, expectation)
            symbols = sym('x',[1 obj.dim]);
            cost_function = (expectation - obj.forward(symbols))^2;
	    % % working up to here
	    % optimiser = matlabFunction(gradient(cost_function));
	    % obj.coefficients = obj.coefficients - optimiser(x);
        end
    end
end
