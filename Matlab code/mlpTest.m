%Test to g³ówny plik programu!
clear; clc; %czyscimy przestrzen pracy i okno komend
wejscia=input('Podaj liczbe wejsc (jednoczesnie l. argumentow): ');  % podawanie kolejnych wymaganych do dzialania sieci danych
warstwa1=input('Podaj ilosc neuronow warstwy ukrytej: ');
warstwa2=input('Podaj ilosc neuronow warstwy drugiej: ');
pPrzedzialu=input('Podaj poczatek przedzialu poczatkowych wag: ');
kPrzedzialu=input('Podaj koniec przdzialu poczatkowych wag: ');
M=wejscia;
wspolUcz=input('Podaj wspolczynnik uczacy: ');
epoki=input('Podaj ilosc epok nauki: ');

for i=1:3  %generowanie danych wejsciowych i wymaganych na te dane odpowidzi , i=1:3 bo mamy 3 nieliniowe funkcje
[Wejscia(:,i),Wyjscia(:,i)]=LosowanieUcz(M,i); %M, bo tyle argumentow bedzie do funkcji
end

[Xsort,Ysort]=sortowanie(Wejscia,Wyjscia)   % mamy gotowe wektory posortowanych danych wejsciowych UCZACYCH 

rysuj(Xsort,Ysort,'Dane uczace, przebieg idealny',0) %wyrysowane to co chcemy miec

[waga1,waga2]=utworz(wejscia, warstwa1, warstwa2, pPrzedzialu,kPrzedzialu) %utorzenie sieci

[y1a,y2a]=przetwarzaj(waga1,waga2,Xsort(:,1),5);  %reakcja na dane wejsciowe  - 3 przyklady zawsze
[y1b,y2b]=przetwarzaj(waga1,waga2,Xsort(:,2),5);  
[y1c,y2c]=przetwarzaj(waga1,waga2,Xsort(:,3),5);
odpPrzed=[y2a,y2b,y2c]

rysuj(Xsort,odpPrzed,'Reakcja nieuczonej sieci na dane wejsciowe',0) % wyrysowane to co wyszlo!

[modW1,modW2]=nauka(waga1, waga2, Xsort, Ysort, wspolUcz, epoki) %nauka
[y1a,y2a]=przetwarzaj(modW1,modW2,Xsort(:,1),5);
[y1b,y2b]=przetwarzaj(modW1,modW2,Xsort(:,2),5);
[y1c,y2c]=przetwarzaj(modW1,modW2,Xsort(:,3),5);

ODP_PO=[y2a,y2b,y2c]

rysuj(Xsort,ODP_PO,'Reakcja na dane wejsciowe po nauce',0)  %wyrysowane to co wyszlo
%______________________S___I__E__C________N_A_U_C_Z_O_N_A_____________________________________________________________________
%Teraz podajemy dane testowe :
for i=1:3  %generowanie danych wejsciowych i wymaganych na te dane odpowidzi , i=1:3 bo mamy 3 nieliniowe funkcje
[WejsciaT(:,i),WyjsciaT(:,i)]=LosujFkcTestujace(M,i); %M, bo tyle argumentow bedzie do funkcji  
end

[XsortT,YsortT]=sortowanie(WejsciaT,WyjsciaT)   % mamy gotowe wektory posortowanych danych wejsciowych Testowych

rysuj(XsortT,YsortT,'Przebieg idealny danych testowych',1) %wyrysowane to co chcemy miec!

[y1a,y2a]=przetwarzaj(modW1,modW2,XsortT(:,1),5);
[y1b,y2b]=przetwarzaj(modW1,modW2,XsortT(:,2),5);
[y1c,y2c]=przetwarzaj(modW1,modW2,XsortT(:,3),5);

ODP_PO=[y2a,y2b,y2c]

rysuj(XsortT,ODP_PO,'Reakcja sieci na dane testowe',1)  %wyrysowane tego co wyszlo po podaniu danych testowych do nauczonej sieci,