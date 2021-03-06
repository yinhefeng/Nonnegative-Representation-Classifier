function C = NNLS( Y, X, XTXinv, Par )

% Input
% y           Testing data matrix
% X           Training Data matrix, dim * num
% XTXinv   inv( X'*X+rho/2*eye(N) )
% Par         parameters

% Objective function:
%      min_{A}  ||Y - X * A||_{F}^{2}  s.t.  A>=0

% Notation: 
% y ... (D x 1) the testing data vector where D is the dimension of input
% data
% X ... (D x N) the training data matrix, where D is the dimension of features, and
%           N is the number of training samples.
% a ... (N x 1) is a column vector used to select
%           the most representive and informative samples to represent the
%           input sample y
% Par ...  struture of regularization parameters
[~, M] = size(Y);
[~, N] = size(X);

%% initialization
A       = zeros (N, M); % satisfy NN constraint
C       = A;
Delta = C - A;

for iter = 1:Par.maxIter
    %% update A the coefficient matrix
    A = XTXinv * (X' * Y + Par.rho/2 * C + 0.5 * Delta);
    
    %% update C the data term matrix
    Q = (A - Delta/Par.rho)/(2*Par.lambda/Par.rho+1);
    C = max(0, Q);
    
    %% update Deltas the lagrange multiplier matrix
    Delta = Delta + Par.rho * ( C - A);
    
    %     %% update rho the penalty parameter scalar
    %     Par.rho = min(1e4, Par.mu * Par.rho);
end
