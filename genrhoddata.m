function genrhoddata

alpha=0.568231496731503;
echarge=1.6021766208e-19; 
hbar=1.054571800e-34;   

cons=echarge.^2./hbar;

load('draggrid-T70.mat');

sigmadfun=@(nqA,nqP) interp2(nA,nP,sigmaDgrid,nqA,nqP,'spline',NaN);

load('monolayersigmas_T70K.mat','n','sigmamono');
nplus=n(2:length(n));
nfullA=[-fliplr(nplus) n];
sigmaplus=sigmamono(2:length(sigmamono));
sigmafullA=[fliplr(sigmaplus) sigmamono];
monocond=@(x) interp1(nfullA,sigmafullA,x,'pchip',NaN);

nAplt=(-100:1:100);
nPplt=(-100:1:100);

rhodplt=zeros(length(nPplt),length(nAplt));

for j=1:length(nAplt)
    sigmaA=monocond(nAplt(j));
%     tic
    for k=1:length(nPplt)
        sigmaP=monocond(nPplt(k));
        sigmad=sigmadfun(nAplt(j),nPplt(k));
        rhodplt(k,j)=-sigmad./(sigmaA.*sigmaP)./cons.*4.*alpha.^2.*pi;
    end
%     toc
end
       
save('rhoddata-T70.mat')

end