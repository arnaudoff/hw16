% A function that generates a chess board of size 8x8
% Sample usage: generate_chessboard(11, 22, 33, 44, 55, 66)

function M = generate_chessboard(pawn, knight, bishop, rook, queen, king)
    flr_v = zeros(8, 1)';
    flr_v([4 5]) = [queen king];
    flr_v_left = [rook knight bishop];
    flr_v([1 2 3]) = flr_v_left;
    flr_v([6 7 8]) = flr_v_left(end:-1:1);
    
    pawns_v = repmat(pawn, 8, 1)';
    
    sm_fr = zeros(8, 1)';
    for i = 1:8
        if mod(i, 2) == 0
            sm_fr(i) = 1;
        end
    end
    sm_sr = sm_fr(end:-1:1);
    
    sm = vertcat(sm_fr, sm_sr);
    
    M = vertcat(flr_v, pawns_v, sm, sm, pawns_v, flr_v);
end