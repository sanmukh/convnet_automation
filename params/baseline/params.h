#ifndef __PARAMS__
#define __PARAMS__

//Baseline: 500*500 image
#define IMG_ROW_SIZE 50
#define IMG_COL_SIZE 50

//Kernel sizes
#define KERN_SIZE_1 9
#define KERN_SIZE_3 9
#define KERN_SIZE_5 9


//sizes of the various convolution processors
//format: ROW_SIZE_##N : N -> index of the processor
#define ROW_SIZE_1 KERN_SIZE_1
#define COL_SIZE_1 KERN_SIZE_1
#define ROW_SIZE_3 KERN_SIZE_3
#define COL_SIZE_3 KERN_SIZE_3
#define ROW_SIZE_5 KERN_SIZE_5
#define COL_SIZE_5 KERN_SIZE_5



#endif
