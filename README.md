## README

frechet3D 方法如接口参数说明：

- 输入的前两个参数为矩阵，矩阵的维度要求必须大于 3 列，且仅仅考虑前 3 列（过多的列数并不会被考虑，虽然你可以选择写）；

  ```matlab
  [1,2,3,1;3,4,5,1;5,6,7,1;7,8,9,1];
  % 等价于
  [1,2,3;3,4,5;5,6,7;7,8,9];
  ```

- 矩阵的每一行代表一个数据，两个矩阵的行数应当是相同的（否则可能计算是有问题的）；

- varargin 代表此方法支持可变参数输入；

测试运行脚本位于 test.m。

代码来源于：https://zhuanlan.zhihu.com/p/20159963

