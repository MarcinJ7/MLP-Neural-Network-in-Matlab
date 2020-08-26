function[waga1mod,waga2mod]=nauka(waga1przed, waga2przed, wejscieUcz, wyjscieUcz, wspolUcz, epoki)
IlePrzykladow=size(wejscieUcz,2); % obliczamy ile przykladow mamy w ciagu uczacym - jest to ilosc kolumn macierzy wej�� ucz�cych
wierszeWaga2=size(waga2przed,1); % obliczamy ilosc wierszy wagi2, bo pozniej obliczajac blad warstwy 1 si� to przyda
waga1=waga1przed; % zmianna uzywana wewnatrz funkcji === waga1przed - podawana waga warstwy1
waga2=waga2przed; % zmianna uzywana wewnatrz funkcji === waga2przed - podawana waga warstwy2
beta=5;
%rozpoczynamy nauke
for i=1:epoki %powtarzamy petle przez okreslona liczbe epok
losowyPrzyklad=ceil(rand(1)*IlePrzykladow);    %wybieramy losowy przyklad - za pomoca ceil zaokraglamy w gore -> rand(1) - od 0-1 * ilosc przykladow, i mamy jakis wylosowany przyklad 
[wyjscie1,wyjscie2]=przetwarzaj(waga1,waga2,wejscieUcz(:,losowyPrzyklad),beta); % obliczamy odpowiedz wyjscia1 oraz wyjscia2 na wylosowany przyklad
wejscie1=[-1;wejscieUcz(:,losowyPrzyklad)]; % -1, bo bias - potrzebny pelny wektor z biasami do liczenia bledu
wejscie2=[-1;wyjscie1]; % -1,bo bias - potrzebny pelny wektor z biasami do liczenia bledu
bladWarstwy2=wyjscieUcz(:,losowyPrzyklad)-wyjscie2; % blad warstwy 2 liczymy prosto - od konkretnego ��danego wyjscia ci�gu ucz�cego odejmujemy otrzymane wyjscia warstwy 2 ( otrzymane jako odpowied� na wej�cie ucz�ce ) wazne jest to, ze wyjscie uczace musi byc zgodne z wejscie uczacym - dotyczyc tego samego przykladu 
bladWarstwy1=waga2(2:wierszeWaga2,:)*bladWarstwy2; % odcinamy biasa i liczymy od tylu -> wagi bez biasa(pozostaja wiersze od 2-ego do liczby wierszy podanej wagi2) *bladWarstwy2 -> to co jest bledem warstwy drugiej powsta�o przez wyj�cia warstwy pierwszej, wi�c b��d z warstwy pierwszej to b��d z drugiej*wagi drugiej

bladWew1=beta*bladWarstwy1.*wyjscie1.*(1-wyjscie1); %mnozenie -> b��d "wewn�trzny" = b��d warstwy * pochodna funkcji aktywacji - sigmoidalnej (dla k-tego neuronu pochdona : f'=yk*(1-yk) , u nas y oznacza wyjscie!)
bladWew2=beta*bladWarstwy2.*wyjscie2.*(1-wyjscie2); % to samo co wyzej

zmianaWagi2=wspolUcz*wejscie2*bladWew2'; % standardowy wzor na zmiane wagi - wspolczynnik uczenia*wyzej wymienione wjescie*blad warstwy
zmianaWagi1=wspolUcz*wejscie1*bladWew1'; % standardowy wzor na zmiane wagi - wspolczynnik uczenia*wyzej wymienione wjescie*blad warstwy
waga1=zmianaWagi1+waga1; % zmieniamy wage1 dodajac do wagi1 wyliczon� zmian�
waga2=zmianaWagi2+waga2; % zmieniamy wage2 dodajac do wagi2 wyliczon� zmian�
end %koniec p�tli
waga1mod=waga1; %po odbyciu zadanej ilosci epok przypisujemy : waga1 -> waga1mod
waga2mod=waga2; %po odbyciu zadanej ilosci epok przypisujemy : waga2 -> waga2mod
end