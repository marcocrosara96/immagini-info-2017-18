img = rgb2gray(imread('lena.jpg'));
%{
Iterative tresholding
1. Seleziono una soglia T (a caso)
2. Divido l’immagine in due regioni usando T
3. Calcolo le medie delle due regioni M1 e M2
4. Aggiorno T: T=(M1+M2)/2
5. Ripeto dal passo 2 fino a che il processo non converge
%}

T = mean(img(:));
T
T1 = 0;

while abs(T - T1) > 1
    T1 = T;
    matrix = img(:)>=T;
    M1 = mean(mean(img(matrix==1)));
    M2 = mean(mean(img(matrix==0)));
    T = (M1+M2)/2;
    !echo g
end

%alternatica più fica
while abs(T - T1) > 1
    T1 = T;
    M1 = mean(mean(img>T));
    M2 = mean(mean(img<T));
    T = (M1+M2)/2;
    !echo g
end

img2 = zeros(size(img));
img2(img > T) = 1;
imshow(img2,[]);



