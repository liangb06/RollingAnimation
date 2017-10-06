
//
//  LayerParameters.h
//  POPAnimation01
//
//  Created by hebe on 17/10/5.
//  Copyright © 2017年 liangbin. All rights reserved.
//

#ifndef LayerParameters_h
#define LayerParameters_h


#ifndef _TopCenter
#define _TopCenter      CGPointMake(0.5f, 0.f )
#define _BottomCenter   CGPointMake(0.5f, 1.f )
#define _LeftCenter     CGPointMake(0.f , 0.5f)
#define _RightCenter    CGPointMake(1.f , 0.5f)
#define _LayerCenter    CGPointMake(0.5f, 0.5f)
#endif
//目前view的朝向
typedef enum : NSUInteger {
    
    CASE_ZERO,          //0.F
    CASE_MPI2,          //M_PI_2
    CASE_MPI,           //M_PI,
    CASE_M3PI2,         //M_PI_2*3.f
    
    CASE_ZERO_MPI2,     //(0.F      ,M_PI_2      )
    CASE_MPI2_MPI,      //(M_PI_2   ,M_PI        )
    CASE_MPI_M3PI2,     //(M_PI     ,M_PI_2*3.f  )
    CASE_M3PI2_M2PI,    //(M_PI     ,M_PI*2.f    )
} LayerCurrentAngleCategory;

//目前layer的旋转方向
typedef enum : NSUInteger {
    Rolling_UP,
    Rolling_Down,
    Rolling_Left,
    Rolling_Right,
} RotationDirection;





#endif /* LayerParameters_h */
