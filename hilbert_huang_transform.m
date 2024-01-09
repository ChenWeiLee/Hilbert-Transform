function y = hilbert_huang_transform(x, t, thr, ls_m)
    % 初始化變量
    x = lowpass_filter_fn(x, ls_m);
    y = x;
    n = 1;
    length = size(y, 2);
    c = zeros(10, length); % 預分配記憶體空間

    % figure(1)
    % plot(t, x)
    % axis([0, 10, -2, 2])

    % 主循環
    iter = 1;
    while iter <= 10 && ~checkMonotonic(y, length)
        iter = iter + 1;
        [y, foundIMF] = findIMF(y, t, length, thr, 30);
        if foundIMF
            c(n, :) = y;
            y = x - sum(c);
            if checkMonotonic(y, length)
                c(n+1, :) = y;
            end
        else
            continue
        end        
        n = n + 1;
    end

    y = c(1:n, :); % return 找到的 IMF
end

% 尋找 IMF 的函數
function [h, foundIMF] = findIMF(y, t, length, thr, maxIter)
    h = y;
    foundIMF = false;

    for k = 1:maxIter
        [idmax, idmin] = findExtrema(h, length);
        spmax = spline(t(idmax), h(idmax), t);
        spmin = spline(t(idmin), h(idmin), t);

        z = (spmax + spmin) * 0.5;
        h = y - z;

        if isIMF(h, t, length, thr)
            foundIMF = true;
            break;
        end
    end
end

% 檢查是否是 IMF
function isIMF = isIMF(h, t, length, thr)
    [hidmax, hidmin] = findExtrema(h, length);
    u1 = spline(t(hidmax), h(hidmax), t);
    u0 = spline(t(hidmin), h(hidmin), t);

    isIMF = all(h(hidmax) > 0) && all(h(hidmin) < 0) && all(abs(u1 + u0) < thr);
end

% 尋找局部極大值和極小值
function [idmax, idmin] = findExtrema(data, length)
    idmax = [];
    idmin = [];
    for i = 2:length-1
        if (data(i) >= data(i-1)) && (data(i) >= data(i+1))
            idmax = [idmax, i];
        elseif (data(i) <= data(i-1)) && (data(i) <= data(i+1))
            idmin = [idmin, i];
        end
    end
end

% 檢查序列是否單調
function isMonotonic = checkMonotonic(data, length)
    isMonotonic = numel(findExtrema(data, length)) <= 2;
end

function denoise_single = lowpass_filter_fn(x, m)
    fprintf("denoise_single")
    n = numel(x);
    filter = zeros(1, n);
    filter([1:m, end-m+1:end]) = 1;

    denoise_single = ifft(fft(x) .* filter);
end
