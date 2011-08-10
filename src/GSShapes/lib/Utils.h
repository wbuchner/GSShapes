/*
* Generated by SGWrapperGen - DO NOT EDIT!
*
* SwinGame wrapper for C - Utils
*
* Wrapping sgUtils.pas
*/

#include <stdbool.h>
#include <stdint.h>

#ifndef sgUtils
#define sgUtils
#include "Types.h"

void calculate_framerate(char *average, char *highest, char *lowest, color *textColor);
void delay(uint32_t time);
void exception_message(char *result);
bool exception_occured();
int32_t get_framerate();
uint32_t get_ticks();
float rnd();
int32_t rnd_upto(int32_t ubound);
void swin_game_version(char *result);
#endif

