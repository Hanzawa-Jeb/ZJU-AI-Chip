Basic Metrics
Pipeline Hazard + Reorder Buffer
Amdahl's Law中的Parallel Portion f实际上也并不能做到完美的并行
- Synchronization Overhead(例如updates to shared data)
- Load Imbalance Overhead (数据加载不能做到完全并行)
- Resource Sharing (内存访问竞争)
Roofline Model
- AI: Arithmetic Intensity
- 越接近Roofline，说明代码更好
- ![[Pasted image 20260309133532.png]]
- 纵轴是Performance， 横轴是Operational Intensity
- 越往右说明对计算的要求更高
- 斜线部分的IO比较密集，有一个斜线，说明受到bandwidth的限制
- 水平线部分受Computing Performance影响
- 增加带宽会让斜率增加，更加陡峭
Little's Law
- `Concurrency = Latency * Throughput`
- $L = \lambda \times W$
- L: Objects waiting in the queue
- $\lambda$: 每秒钟到达的Object数量
- W: 实体在系统中的平均停留时间
Von Neumann Arch:
- Stored Program
	- Memory is unified between instructions and data
	- Stored linearly
- Sequential Instruction Processing
