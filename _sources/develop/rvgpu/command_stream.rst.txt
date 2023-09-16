RVGPU命令流
=======================

Command Stream
#######################
RVGPU的命令流（command stream）是CPU控制GPU的命令组合，RVGPU中的命令包含如下：

- 顶点处理命令

- 像素处理命令

- ... 后面会添加更多的命令

command stream的格式如下：
::

    command_stream   ----->  +-------------+
                             | Command 1   |
                             +-------------+
                             | Command 2   |
                             +-------------+
                             | Command 3   |
                             +-------------+
                             | ......      |
                             +-------------+
                             | END Command |
                             +-------------+
                            
Command的结构如下：
::

    typedef struct {
        enum cs_type type;
        union {                                                 
            command_vs vs; 
            command_fs fs;
        } cmd;
    } command;

其中 command 类型定义如下：
::

    enum cs_type {
        CS_TYPE_VS = 1,
        CS_TYPE_FS = 2,
        CS_TYPE_END = 3,
    }

其中 vs command 和 fs command 定义如下：
::

    typedef struct {
        uint32_t vertex_count;
        uint64_t shader;
        uint64_t layout;
    } command_vs;

    typedef struct {
        xxxxx
    } command_fs;

字段 shader为一个指针，指向存储着色器程序的地址。layout为一个结构体，这个结构体是用户自定义的，指向的的是shader的输入输出接口。
比如要进行如下的两个数组相加：
::

    array_out[i] = array_a[i] + array_b[i];

则这段shader程序的输入为两个数组的指针，输出为结构数组的指针，则可以定义layout为：
::

    struct layout {
        uint32_t *array_a;
        uint32_t *array_b;
        uint32_t *array_out;
    };
