fprintf('Reproducing Figure 8......\n')
data0 = data_bak;
positiveBOLD = data0(:,10)<5.5 & ismember(data0(:,7),[1 2 3]) & all(isfinite(data0(:,combos{1})),2);
data0 = data0(positiveBOLD,:);
y = data0(:,1);

clear X
for c = 1 : length(combos{1})
    
    X(:,c) = zscore(data0(:,combos{1}(c)));
    
end

X(:,end+1) = 1;  % constant term
h = X\y;
modelfit = X*h;

X = double(X);
y = double(y);
params0 = [1 1 1];
paramslb = [0 0 0];
params0 = [1 1 1];
paramslb = [0 0 0];
paramsub = [];

options = optimset('Display','off','FunValCheck','on','MaxFunEvals',Inf,'MaxIter',Inf,'TolFun',1e-6,'TolX',1e-6);
objective = @(pp) sqrt(abs(y - (pp(1) * (posrect(X*h) .^ pp(2)) + pp(3))));
[params,d,d,exitflag,output] = lsqnonlin(objective,params0,paramslb,paramsub,options);
% params = [ 0.0027    3.9883    2.3890]


modelfit2 = params(1) * (posrect(X*h) .^ params(2)) + params(3);

%%
figure(8);
subplot(1,3,1)
binx = [-2:0.02:10];
biny = [-2:0.2:30];
[n] = hist2d(flatten(modelfit),flatten(y),binx,biny);

h1 = imagesc(log(n)); colormap(hot);
set(h1,'XData',[binx(1) binx(end)],'YData',[biny(1) biny(end)]);
axis tight square;
set(gca,'YDir','normal');
caxis([0 7]);
ylabel('%BOLD');
xlabel('X*Beta');
xticks([-2 0 2 4 6 8 10]);
set(gca,'Fontsize',15);
%%
subplot(1,3,2)

h1 = imagesc(log(n)); colormap(hot);
set(h1,'XData',[binx(1) binx(end)],'YData',[biny(1) biny(end)]);
axis tight square;
set(gca,'YDir','normal')
caxis([0 6])
ylabel('%BOLD')
xlabel('X*Beta')
xticks([-2 0 2 4 6 8 10])

fit_to_plot = params(1) * (binx .^ params(2)) + params(3); hold on
s=plot(binx,fit_to_plot,'b-','LineWidth',2);
legend(s,'fit')
ylabel('%BOLD')
xlabel('X*Beta')
set(gca,'Fontsize',15)

%%
subplot(1,3,3)
yfixed = y./modelfit2;

binx = [-2:0.02:10];
biny = [-2:0.2:30];
[n] = hist2d(flatten(modelfit),flatten(yfixed),binx,biny);

h1 = imagesc(log(n)); colormap(hot);
set(h1,'XData',[binx(1) binx(end)],'YData',[biny(1) biny(end)]);
axis tight square;
set(gca,'YDir','normal')
caxis([0 6])
ylabel('Corrected %BOLD')
xlabel('X*Beta')
xticks([-2 0 2 4 6 8 10])
data0(:,end+1) = yfixed;
set(gca,'Fontsize',15)
