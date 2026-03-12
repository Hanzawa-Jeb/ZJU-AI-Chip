Pipeline Hazards
- Structural Hazards: 硬件资源导致的Conflict
	- 多个Instruction想要同时访问相同的Hardware Resource
	- 通过Bubble(Stall)来进行解决
	- Solution: Multiple Access Avail
	- 例如实现有多个读写口的MEM与Reg
- Data Hazards: 
	- Flow Dependence(Read After Write)
	- Hardware Pipeline Stall
		- 分别由硬件或者软件负责检测Stall的出现并处理
		- 已经存在的Following指令堵住
		- New Instructions直接停止Fetch过程
	- Software Pipeline Stall
		- 主要问题是内存指令要插入的NOP数量是未知的，会有大问题
Multi-Cycle Execution: 
- 将流水线切分为不同的Segment, 让每一个指令拥有不同的执行周期长度
Exceptions and Interrupts
- Program Execution中也会出现Unplanned Changes or interruptions
- Exceptions是Internal Problems
- Interrupts是External events
- 中断->保存当前状态->进行interrupt handling->回到被中断程序执行
- CPU越复杂，需要处理Interrupts/Exceptions的时间就更长
- 在面临Interrupts的时候，需要确保干净的中断，前面的指令要完全完成执行
Reorder Buffer
- 执行指令的时候乱序，存入到Reorder Buffer中，Reorder Buffer写回RegFile的时候是按照顺序写入的
- ROB控制的是写回的顺序满足输入的顺序
- Register存储了存储了寄存器值的reorder buffer entry的ID编号
Out-of-order
- OOR流水线中Reorder Buffer可以用于解决False Dependencies
- False Dependencies中的Output and anti dependencies并不是真正的dependences
- False Dependencies在拥有Reorder的时候产生问题
- 通过重命名Register ID为Reorder Buffer Entry
- WAR: Anti-dependence
- Reorder Buffer Reg的数量一定要比寄存器要多