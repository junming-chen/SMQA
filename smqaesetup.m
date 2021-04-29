function smqae =smqaesetup(Nsize, y)
    l_y = size(y,2);
    for u = 2 : numel(Nsize)
        smqae.ae{u-1} = nnsetup([Nsize(u-1) Nsize(u) Nsize(u-1)+l_y]);
    end
end
