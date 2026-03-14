有四个文件需要完成
`CtrlUnit.v, EXE_stage.v, SAMV.v, Mac.v`

## CtrlUnit
dataToReg是一个两位的信号，具体作用参考下面的代码
![[Pasted image 20260314102502.png]]
- 这里我们可以看到dataToReg是用来选择写回信号的Mux，那么我们在这里就要选择相对应的值进行写回，例如0对应memData，1对应SAMV Output， 2对应ALUoutput
- 我当前使用掩码的方式来进行这个信号的Assign
![[Pasted image 20260314103651.png]]
就按照这里的风格进行写回
regWrite代表的是是否写入寄存器的信号，所以只要是有rd的指令，这个regWrite都要被设置为1，除了其他要写入的之外，SAMV_valid也可以加上
## Mac
- 这里要实现的功能也很简单，就是实例化一个mult4，连线再加上值就可以了
- 但是注意要求输出的是9位的值，所以我实例化了一个add_32，再进行了截断。
## SAMV
我们可以先关注一下在EXE_stage.v文件中的接线方式，这里A和B应该对应的就是rs1和rs2中的数据，解码的时候要注意
关于这个==位宽的问题？==
