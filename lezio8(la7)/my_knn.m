function lab_final= my_knn(train, labels, test, k)

lt = length(train);
ls = length(test);

lab_final = zeros(1,ls);
for i = 1:ls
    
    pattern = test(i,:);
    
    pattern = repmat(pattern, [lt,1]);
    
    dis = sqrt(sum((pattern-train).^2 ,2));
    
    [Y,I] = sort(dis);
    
    labels_ord = labels(I);
    
    lab_final(i) = mode(labels_ord(1:k));
    
    
end