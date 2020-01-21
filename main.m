a = linear(1, 0.001);

% teaching it x = y
data_set = [];
for i = 1:1000
	x = randi(200);
	data_set = [data_set; [x, x]];
	plot(x,x,'+g')
	hold on
end
hold off
title('Random Samples')

figure;
batch_size = 100;
for i = 1:100
	%data = data_set(i:i+batch_size,:)
	shuffle = data_set(randperm(length(data_set)),:);
	data = shuffle(1:batch_size,:);
	%opt = a.backward(data_set(i,1), data_set(i,2));
	opt = a.batch_back(data);
	tmp = opt(a.coefficients(1), a.coefficients(2));
	grad = a.learning_rate*(tmp/length(data))
        a.coefficients = a.coefficients - grad;
	plot(i, a.cost(data_set,a.coefficients'), '*r')
	hold on
end
hold off
title('global cost against iterations');
xlabel('iteration')
ylabel('cost')
