function [smqae,full_batch_train_err] = smqaetarin(smqae, x,y, opts)
full_batch_train_err=[];
    for i = 1 : numel(smqae.ae)
%         disp(['Training AE ' num2str(i) '/' num2str(numel(mvwsqae.ae))]);
        opts.SPPE = use_mic(x, y);
        opts.SPPE = [ opts.SPPE; sum(opts.SPPE)*ones(size(y,2),1)/size(y,2)];
        [smqae.ae{i},full_batch_train_err1] = nntrain2(smqae.ae{i}, x, [x y], opts);
        t = nnff(smqae.ae{i}, x, [x y]);
        x = t.a{2};
        %remove bias term
        x = x(:,2:end);
        full_batch_train_err = [full_batch_train_err,full_batch_train_err1];
    end
end
