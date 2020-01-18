classdef linear
    properties
        coefficients;
        learning_rate;
        dim;
    end
    methods
        function obj = linear(dim_in, learning_rate_in)
            obj.dim = dim_in;
            obj.coefficients = rand(dim_in + 1, 1);
            obj.learning_rate = learning_rate_in;
        end
        function y = forward(obj, x)
            y = [x,1] * obj.coefficients;
        end
        function optimiser = backward(obj, input, expectation)
            symbols = sym('a',[1 obj.dim+1]);
            cost_function = sqrt((expectation - [input,1]*symbols')^2);
	    % % working up to here
	    optimiser = matlabFunction(gradient(cost_function));
	    %obj.coefficients = obj.coefficients - optimiser(input);
        end
    end
end
