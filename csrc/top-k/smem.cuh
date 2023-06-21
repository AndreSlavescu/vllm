#ifndef _SMEM_H_
#define _SMEM_H_

#include <type_traits>

// shared memory template
template <typename T>
struct SMEM
{
    static_assert(std::is_arithmetic_v<T>);
};

#define SMEM_DEFININTIONS(Type)            \
    template <>                            \
    struct SMEM<Type>                      \
    {                                      \
        __device__ Type *getPointer()      \
        {                                  \
            extern __shared__ Type smem[]; \
            return smem;                   \
        }
}
;

// required types

// int types
SMEM_DEFININTIONS(int)
SMEM_DEFININTIONS(unsigned int)

// char types
SMEM_DEFININTIONS(char)
SMEM_DEFININTIONS(unsigned char)

// short num types
SMEM_DEFININTIONS(short)
SMEM_DEFININTIONS(unsigned short)

// long num types
SMEM_DEFININTIONS(long)
SMEM_DEFININTIONS(unsigned long)

// boolean
SMEM_DEFININTIONS(bool)

// float types
SMEM_DEFININTIONS(float)
SMEM_DEFININTIONS(double)

#undef SMEM_DEFININTIONS
#endif