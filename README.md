# NMRDownload-Batch自述文件
NMRDownload-Batch是我自己编写的一个批处理脚本，亮点是通过批处理实现了日期计算功能。

该批处理通过避开了Windows任务管理器的UI界面，大大提升了访问NAS服务器的效率。

如果您要Clone本项目，请在使用之前请务必更改文件中\*\*\*部分。

项目爱称：☆あおしま☆
###更新历史/随笔
4.2是最早做了日期回溯模块的版本，4.4在4.2基础上修补了一下。

从5.0开始我终于发现问题所在了……把“复制”功能写成“剪切”了。由于没有权限，自然运行起来会很慢。

另外有一个很有意思的状况——为什么偶尔有的时候会提示“是否覆盖Y/N”（但绝大多数时候不会）呢？

想了很久才明白，核磁数据并不是在进样器把核磁管弹出来之后才生成的。而是在样品进样之后，立即创建了数据文件，然后每次扫描将数据增量记录下来。这应当与Gaussian的OUT文件逻辑类似。事实上这也不难理解——当你扫描C<sup>13</sup>时总不能在内存里存放114514次的数据吧？

`btw，感谢G16W，如此低下的效率才能让我想明白这件事。`

因此，如果在扫描的过程中在核磁工作站上执行了同步任务，NAS上就会存在一个“不完整的”核磁文件。如果你不巧用本程序同步了不完整的核磁文件，在第二次运行时CMD就会提示是否覆盖已有文件。

所以，提示“是否覆盖Y/N”的情况绝大多数情况都出现在扫描C<sup>13</sup> NMR时出现。然而，本程序的编写和QA都是在核磁不工作的晚上执行的，因此，我根本就没意识到需要对Xcopy添加/y，从而出现了这种状况。

加上了就好了。
