clc,clear all,close all
dosya=dir('*.*p');
netA = darknet53;
inputSizeA = netA.Layers(1).InputSize;
  layer1 = 'conv53';
for k=1:length(dosya)
    res=imread(dosya(k).name);
%     [ww,hh,ll]=size(res);
%     if ll==1
%         res(:,:,1)=res(:,:,1); res(:,:,2)=res(:,:,1); res(:,:,3)=res(:,:,1);
%     end
    res=imresize(res,[295,295]);
    res=histeq(res);
%     augimdsTrainA = augmentedImageDatastore(inputSizeA(1:2),res);        
%             fm = activations(netA,augimdsTrainA,layer1,'OutputAs','rows');
%             X(k,1:1000)=[fm];
    center=149;
    sayac=19;
    for i=1:8
        exm=res(center-(sayac):center+(sayac),center-(sayac):center+(sayac),:);
        augimdsTrainA = augmentedImageDatastore(inputSizeA(1:2),exm);        
            fm = activations(netA,augimdsTrainA,layer1,'OutputAs','rows');
            X(k,(i-1)*1000+1:(i)*1000)=[fm];
            sayac=sayac+18;
    end
    y(k)=str2num(dosya(k).name(1));
end
X=(X-min(X))./(max(X)-min(X)+eps);
mdl=fscnca(X,y,'Solver','sgd','Verbose',1);
xx=mdl.FeatureWeights;
[aa,idx]=sort(xx,'desc');
for i=1:1000
son1(:,i)=X(:,idx(i));
end
[aa,bb]=relieff(son1,y',10);
syc=1;
for i=1:1000
    if bb(i)>0
        son(:,syc)=son1(:,i);
        syc=syc+1;
    end
end
son(:,syc)=y;
save son.mat son