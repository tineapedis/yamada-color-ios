//
//  Filter.metal
//  yamada-color-ios
//  
//  Created by nmurata on 2021/09/25
//  
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h>

extern "C" {
    namespace coreimage {
        half4 customFilter(sample_h sample) {
            half4 color = sample.rgba;
            half3 checkColor = round(linear_to_srgb(color.rgb) * 255);
            half3 convertColor = half3(255.0/255.0, 128.0/255.0, 20.0/255.0);
            
            if ((checkColor.r == 128) && (checkColor.g == 128) && (checkColor.b == 128)) {
                color = half4(srgb_to_linear(convertColor), 1.0);
            }
            
            return color;
        }
    }
}
