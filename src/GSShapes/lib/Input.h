/*
* Generated by SGWrapperGen - DO NOT EDIT!
*
* SwinGame wrapper for C - Input
*
* Wrapping sgInput.pas
*/

#include <stdbool.h>
#include <stdint.h>

#ifndef sgInput
#define sgInput
#include "Types.h"

bool any_key_pressed();
void end_reading_text(char *result);
void hide_mouse();
bool key_down(key_code key);
void key_name(key_code key, char *result);
bool key_typed(key_code key);
bool mouse_clicked(mouse_button button);
bool mouse_down(mouse_button button);
vector mouse_movement();
point2d mouse_position();
vector mouse_position_as_vector();
bool mouse_shown();
bool mouse_up(mouse_button button);
float mouse_x();
float mouse_y();
void move_mouse_to_point(const point2d *point);
void move_mouse_to_point_byval(const point2d point);
void move_mouse(unsigned short int x, unsigned short int y);
void process_events();
bool reading_text();
void show_mouse();
void set_mouse_visible(bool show);
void start_reading_text_within_area(color textColor, int32_t maxLength, font theFont, const rectangle *area);
void start_reading_text_within_area_byval(color textColor, int32_t maxLength, font theFont, const rectangle area);
void start_reading_text(color textColor, int32_t maxLength, font theFont, int32_t x, int32_t y);
void start_reading_text_with_text_at_pt(const char *text, color textColor, int32_t maxLength, font theFont, const point2d *pt);
void start_reading_text_with_text_at_pt_byval(const char *text, color textColor, int32_t maxLength, font theFont, const point2d pt);
void start_reading_text_with_text_in_area(const char *text, color textColor, int32_t maxLength, font theFont, const rectangle *area);
void start_reading_text_with_text_in_area_byval(const char *text, color textColor, int32_t maxLength, font theFont, const rectangle area);
void start_reading_text_with_text(const char *text, color textColor, int32_t maxLength, font theFont, int32_t x, int32_t y);
bool text_entry_cancelled();
void text_read_as_ascii(char *result);
bool window_close_requested();
#endif
