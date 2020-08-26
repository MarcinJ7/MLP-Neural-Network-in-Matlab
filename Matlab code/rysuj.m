function rysuj(X1,Y1,tytul,rodzajDanych)
figure('Name',tytul); % tytul
plot(X1(:,1),Y1(:,1),'--','LineWidth',3)
title(tytul)
hold on
plot(X1(:,2),Y1(:,2),'LineWidth',3)
hold on
plot(X1(:,3),Y1(:,3),':','LineWidth',3)
hold on
if rodzajDanych==0 % legenda uczace
lgd=legend('y1=3x^2+2x-0.2','y2=x^2+2x+0.3','y3=x^2-x+0.1')
end
if rodzajDanych==1 % legenda testujace
lgd=legend('0.2x^2-x+0.4','0.1x^2-0.5x+0.2','0.2x^2+x-0.3')
end
set(lgd,'FontSize',14) % czcionka rozmiar
title(lgd,'Legenda:') % tytul
end