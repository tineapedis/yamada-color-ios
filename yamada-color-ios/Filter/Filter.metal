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
            half3 checkColor = linear_to_srgb(color.rgb) * 255;

            half3 orange = half3(255.0/255.0, 128.0/255.0, 20.0/255.0);
            half3 red = half3(255.0/255.0, 0.0/255.0, 0.0/255.0);
            half3 blue = half3(0.0/255.0, 0.0/255.0, 255.0/255.0);
            half3 green = half3(0.0/255.0, 255.0/255.0, 0.0/255.0);

            // Purple
            if (checkColor.r == 186) {
                color = half4(srgb_to_linear(orange), 1.0);
            }
            // Yellow
            if (checkColor.b == 0) {
                color = half4(srgb_to_linear(green), 1.0);
            }
            // Pink
            if (checkColor.b == 203) {
                color = half4(srgb_to_linear(blue), 1.0);
            }
            // Black
            if (checkColor.r == 0 && checkColor.g == 0 && checkColor.b == 0) {
                color = half4(srgb_to_linear(red), 1.0);
            }
            
            return color;
        }
    }
}
