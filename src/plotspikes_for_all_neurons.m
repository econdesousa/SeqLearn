clear all
clc
close all
tic
load out_data_size.dat
load out_P_spike_ids.dat
load out_P_spike_times.dat




np          = out_data_size(1);   % N_Principal_NEURONS
ng          = out_data_size(2);   % N_gate_interneurons
n_patt      = out_data_size(3);   % N_PATTERNS
patt_size   = out_data_size(4);   % PATTERN_SIZE

out_P_spike_times = out_P_spike_times./1000; %change units to seconds



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% plot inhibitory interneurons %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ind = find(out_P_spike_ids<np);
figure                              

plot(out_P_spike_times(ind),out_P_spike_ids(ind),'.','MarkerSize',6)
set(gca,'YLim',[0-1,np])
set(gca,'YTick',0:patt_size:np-1)
set(gca,'YTickLabel','')
grid
% xlim([0,35])
xlabel('Time [s]')
ylabel('Inhibitory Interneuron ID')
set(gcf,'Position',get(0,'ScreenSize'))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% plot principal neurons %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind = find(out_P_spike_ids>np-1&out_P_spike_ids<2*np);
figure                              % plot principal_neurons
ytick=[0,np-1];
j=1;yticklabel={};
for i=ytick
    yticklabel{j}='';
    j=j+1;
end
yticklabel{1}=num2str(0);yticklabel{end}=num2str(ytick(end));

xtick=0:2:max(out_P_spike_times(ind));xtick(end+1)=xtick(end)+2;
j=1;xticklabel={};
for i=xtick
    xticklabel{j}='';
    j=j+1;
end
xticklabel{1}=num2str(0);xticklabel{end}=num2str(xtick(end));
plot(out_P_spike_times(ind),out_P_spike_ids(ind)-np,'.','MarkerSize',6)
set(gca,'YTick',ytick)
set(gca,'YLim',[0-1,np])
set(gca,'YTickLabel',yticklabel)
set(gca,'XTick',xtick)
set(gca,'XLim',[0, xtick(end)])
set(gca,'XTickLabel',xticklabel)
xlabel('Time [s]')
ylabel('Principal Neuron ID')
set(gcf,'Position',get(0,'ScreenSize'))
% grid


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% plot gate interneurons %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                
col={[1,0,0],[0,0,1]};

figure                              % plot principal_neurons
hold on


for i=0:np-1
    ind = find(out_P_spike_ids>=2*np+i*ng&out_P_spike_ids<2*np+(i+1)*ng);  
    plot(out_P_spike_times(ind),out_P_spike_ids(ind),'.','MarkerSize',6,'color',col{mod(i,2)+1})
end
hold off
set(gca,'YLim',[2*np,np*(2+ng)])
set(gca,'YTick',2*np:ng:np*(2+ng))
set(gca,'YTickLabel','')
xlabel('Time [s]')
ylabel('Gate Interneuron ID')
set(gcf,'Position',get(0,'ScreenSize'))
grid
toc

            
