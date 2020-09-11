%% Frechet Distance between two curves (3D)
%% 网址：https://zhuanlan.zhihu.com/p/20159963
%% 输入的前两个参数为矩阵，矩阵的维度要求必须大于 3 列，且仅仅考虑前 3 列，
%% varargin 代表此方法支持可变参数输入
%% 矩阵的每一行代表一个数据，两个矩阵的行数应当是相同的（否则可能计算是有问题的）

function f = frechet3D(P1,P2,varargin)

X1=P1(:,1);%获取举证的第1列

X2=P2(:,1);

Y1=P1(:,2);%获取举证的第2列

Y2=P2(:,2);

Z1=P1(:,3);%获取举证的第3列

Z2=P2(:,3);

%get path point length

L1=length(X1);

L2=length(X2);

%check vector lengths
% 要求举证的列向量有着相同的长度
if or(L1~=length(Y1),L2~=length(Y2))

    error('Paired input vectors (Xi,Yi) must be the same length.')

end

%check for column inputs

if or(or(size(X1,1)<=1,size(Y1,1)<=1),or(size(X2,1)<=1,size(Y2,1)<=1))

    error('Input vectors must be column vectors.')

end

%create maxtrix forms

X1_mat=ones(L2,1)*X1';

Y1_mat=ones(L2,1)*Y1';

Z1_mat=ones(L2,1)*Z1';

X2_mat=X2*ones(1,L1);

Y2_mat=Y2*ones(1,L1);

Z2_mat=Z2*ones(1,L1);

%calculate frechet distance matrix

frechet1=sqrt((X1_mat-X2_mat).^2+(Y1_mat-Y2_mat).^2+(Z1_mat-Z2_mat).^2);

fmin=min(frechet1(:));

fmax=max(frechet1(:));

%handle resolution

if ~isempty(varargin)

    res=varargin{1};

    if res<=0

        error('The resolution parameter must be greater than zero.')

    elseif ((fmax-fmin)/res)>10000

        warning('Given these two curves, and that resolution, this might take a while.')

    elseif res>=(fmax-fmin)

        warning('The resolution is too low given these curves to compute anything meaningful.')

        f=fmax;

        return

    end

else

    res=(fmax-fmin)/100;

end

%compute frechet distance

clear f

for q3=fmin:res:fmax

    im1=bwlabel(frechet1<=q3);

%get region number of beginning and end points

    if and(im1(1,1)~=0,im1(1,1)==im1(end,end))

        f=q3;

        break

    end

end

if (~(exist ('f')))

    f=fmax;

end

% disp(f)

return