data = load('differential_test.txt');
X = data(:, [1, 2]); y = data(:, 3);

run = find(y==3);
walk = find(y==2);
rest = find(y==1);

hold on
plot(X(walk,1),X(walk,2),'b+', 'LineWidth',2,'MarkerSize',7);
plot(X(rest,1),X(rest,2),'ko', 'LineWidth',2,'MarkerSize',7);
plot(X(run,1),X(run,2),'rx','LineWidth',2,'MarkerSize',7);

legend('walk', 'rest','run')
xlabel('Average Diff AP-axis')
ylabel('Average Diff SI-axis')
