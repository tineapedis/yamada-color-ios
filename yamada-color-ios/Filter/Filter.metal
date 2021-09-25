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
        half4 customFilter(sample_h sample, half4 purple, half4 yellow, half4 pink, half4 black) {
            half4 color = sample.rgba;
            half3 checkColor = linear_to_srgb(color.rgb) * 255;

            // Purple
            if (checkColor.r == 186) {
                color = purple;
            }
            // Yellow
            if (checkColor.b == 0) {
                color = yellow;
            }
            // Pink
            if (checkColor.b == 203) {
                color = pink;
            }
            // Black
            if (checkColor.r == 0 && checkColor.g == 0 && checkColor.b == 0) {
                color = black;
            }
            
            return color;
        }
    }
}
