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
	        optimiser = matlabFunction(gradient(cost_function));
        end
	function e = err(obj, input, expectation, state)
		e = expectation - [input,1]*state';
	end

	function optimiser = batch_back(obj, data)
		symbols = sym('a', [1 obj.dim+1]);
		rms = obj.cost(data, symbols);
		optimiser = matlabFunction(gradient(rms));
	end
	function rms = cost(obj, data, state)
		sos = 0; % Sum of Square
		for d = data'
			sos  = sos + obj.err(d(1),d(2),state)^2;
		end
		ms = sos/length(data); % Mean Square
		rms = sqrt(ms); % Root Mean Square
	end
    end
end
