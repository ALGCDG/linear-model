classdef linear
    properties
        coefficients;
        bias;
        learning_rate;
        dim;
    end
    methods
        function obj = linear(dim_in, learning_rate_in)
            obj.dim = dim_in
            obj.randomise()
            obj.learning_rate = learning_rate_in
        end
        function y = forward(obj, x)
            y = coefficients * x + bias
        end
        function backward(obj, x, expectation)
            symbols = sym(x,[1 size])
            cost = (expectation - self.forward(symbols))^2
            coefficients = coefficients - gradient(cost)(x)
        end
        function randomise(obj)
            obj.coefficients = rand(obj.dim, 1);
            obj.bias = rand();
        end 
    end
end