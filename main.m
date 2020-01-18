a = linear(1, 0.1);

% teaching it x = y
data_set = [];
for i = 1:10
	x = randi(200);
	data_set = [data_set; [x, x]];
end

plot(data_set(1:end, 1), data_set(1:end, 2), '*')
for i = 1:100
	for data = data_set
		opt = a.backward(data(1),data(2));
		%a.coefficients
		tmp = normalize(opt(a.coefficients(1), a.coefficients(2)));
		a.coefficients = a.coefficients - a.learning_rate*tmp;
	end 
end

