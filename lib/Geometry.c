/*
* Generated by SGWrapperGen - DO NOT EDIT!
*
* SwinGame wrapper for C - Geometry
*
* Wrapping sgGeometry.pas
*/

#include "SGSDK.h"
#include "Geometry.h"

#include "Types.h"

vector add_vectors(const vector *v1, const vector *v2)
{
    return sg_Geometry_AddVectors(v1, v2);
}

vector add_vectors_byval(const vector v1, const vector v2)
{
    return sg_Geometry_AddVectors(&v1, &v2);
}

void apply_matrix_to_points(matrix2d m, point2d *pts, int32_t pts_len)
{
    sg_Geometry_ApplyMatrixToPoints(m, pts, pts_len);
}

void apply_matrix_to_points_byval(matrix2d m, point2d *pts, int32_t pts_len)
{
    sg_Geometry_ApplyMatrixToPoints(m, pts, pts_len);
}

void apply_matrix(matrix2d m, triangle tri)
{
    sg_Geometry_ApplyMatrix(m, tri);
}

void apply_matrix_byval(matrix2d m, triangle tri)
{
    sg_Geometry_ApplyMatrix(m, tri);
}

float calculate_angle_between_vectors(const vector *v1, const vector *v2)
{
    return sg_Geometry_CalculateAngleBetweenVectors(v1, v2);
}

float calculate_angle_between_vectors_byval(const vector v1, const vector v2)
{
    return sg_Geometry_CalculateAngleBetweenVectors(&v1, &v2);
}

float calculate_angle_between_sprites(sprite s1, sprite s2)
{
    return sg_Geometry_CalculateAngleBetweenSprites(s1, s2);
}

float calculate_angle(float x1, float y1, float x2, float y2)
{
    return sg_Geometry_CalculateAngle(x1, y1, x2, y2);
}

float calculate_angle_between(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_CalculateAngleBetween(pt1, pt2);
}

float calculate_angle_between_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_CalculateAngleBetween(&pt1, &pt2);
}

point2d circle_center_point(const circle *c)
{
    return sg_Geometry_CircleCenterPoint(c);
}

point2d circle_center_point_byval(const circle c)
{
    return sg_Geometry_CircleCenterPoint(&c);
}

circle circle_from_xy(float x, float y, int32_t radius)
{
    return sg_Geometry_CircleFromXY(x, y, radius);
}

circle circle_at(const point2d *pt, int32_t radius)
{
    return sg_Geometry_CircleAt(pt, radius);
}

circle circle_at_byval(const point2d pt, int32_t radius)
{
    return sg_Geometry_CircleAt(&pt, radius);
}

int32_t circle_radius(const circle *c)
{
    return sg_Geometry_CircleRadius(c);
}

int32_t circle_radius_byval(const circle c)
{
    return sg_Geometry_CircleRadius(&c);
}

bool circle_within_rect(const circle *c, const rectangle *rect)
{
    return sg_Geometry_CircleWithinRect(c, rect) != 0;
}

bool circle_within_rect_byval(const circle c, const rectangle rect)
{
    return sg_Geometry_CircleWithinRect(&c, &rect) != 0;
}

float circle_x(const circle *c)
{
    return sg_Geometry_CircleX(c);
}

float circle_x_byval(const circle c)
{
    return sg_Geometry_CircleX(&c);
}

float circle_y(const circle *c)
{
    return sg_Geometry_CircleY(c);
}

float circle_y_byval(const circle c)
{
    return sg_Geometry_CircleY(&c);
}

point2d closest_point_on_circle(const point2d *fromPt, const circle *c)
{
    return sg_Geometry_ClosestPointOnCircle(fromPt, c);
}

point2d closest_point_on_circle_byval(const point2d fromPt, const circle c)
{
    return sg_Geometry_ClosestPointOnCircle(&fromPt, &c);
}

point2d closest_point_on_line_xy(float x, float y, const line_segment *line)
{
    return sg_Geometry_ClosestPointOnLineXY(x, y, line);
}

point2d closest_point_on_line_xy_byval(float x, float y, const line_segment line)
{
    return sg_Geometry_ClosestPointOnLineXY(x, y, &line);
}

point2d closest_point_on_line(const point2d *fromPt, const line_segment *line)
{
    return sg_Geometry_ClosestPointOnLine(fromPt, line);
}

point2d closest_point_on_line_byval(const point2d fromPt, const line_segment line)
{
    return sg_Geometry_ClosestPointOnLine(&fromPt, &line);
}

point2d closest_point_on_line_from_circle(const circle *c, const line_segment *line)
{
    return sg_Geometry_ClosestPointOnLineFromCircle(c, line);
}

point2d closest_point_on_line_from_circle_byval(const circle c, const line_segment line)
{
    return sg_Geometry_ClosestPointOnLineFromCircle(&c, &line);
}

point2d closest_point_on_lines_from_circle(const circle *c, const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_ClosestPointOnLinesFromCircle(c, lines, lines_len);
}

point2d closest_point_on_lines_from_circle_byval(const circle c, const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_ClosestPointOnLinesFromCircle(&c, lines, lines_len);
}

point2d closest_point_on_rect_from_circle(const circle *c, const rectangle *rect)
{
    return sg_Geometry_ClosestPointOnRectFromCircle(c, rect);
}

point2d closest_point_on_rect_from_circle_byval(const circle c, const rectangle rect)
{
    return sg_Geometry_ClosestPointOnRectFromCircle(&c, &rect);
}

float cosine(float angle)
{
    return sg_Geometry_Cosine(angle);
}

point2d distant_point_on_circle(const point2d *pt, const circle *c)
{
    return sg_Geometry_DistantPointOnCircle(pt, c);
}

point2d distant_point_on_circle_byval(const point2d pt, const circle c)
{
    return sg_Geometry_DistantPointOnCircle(&pt, &c);
}

bool distant_point_on_circle_heading(const point2d *pt, const circle *c, const vector *heading, point2d *oppositePt)
{
    return sg_Geometry_DistantPointOnCircleHeading(pt, c, heading, oppositePt) != 0;
}

bool distant_point_on_circle_heading_byval(const point2d pt, const circle c, const vector heading, point2d *oppositePt)
{
    return sg_Geometry_DistantPointOnCircleHeading(&pt, &c, &heading, oppositePt) != 0;
}

float dot_product(const vector *v1, const vector *v2)
{
    return sg_Geometry_DotProduct(v1, v2);
}

float dot_product_byval(const vector v1, const vector v2)
{
    return sg_Geometry_DotProduct(&v1, &v2);
}

void fix_rectangle(rectangle *rect)
{
    sg_Geometry_FixRectangle(rect);
}

void fix_rect(float *x, float *y, int32_t *width, int32_t *height)
{
    sg_Geometry_FixRect(x, y, width, height);
}

void identity_matrix(matrix2d result)
{
    sg_Geometry_IdentityMatrix(result);
}

rectangle inset_rectangle(const rectangle *rect, int32_t insetAmount)
{
    return sg_Geometry_InsetRectangle(rect, insetAmount);
}

rectangle inset_rectangle_byval(const rectangle rect, int32_t insetAmount)
{
    return sg_Geometry_InsetRectangle(&rect, insetAmount);
}

rectangle intersection(const rectangle *rect1, const rectangle *rect2)
{
    return sg_Geometry_Intersection(rect1, rect2);
}

rectangle intersection_byval(const rectangle rect1, const rectangle rect2)
{
    return sg_Geometry_Intersection(&rect1, &rect2);
}

vector invert_vector(const vector *v)
{
    return sg_Geometry_InvertVector(v);
}

vector invert_vector_byval(const vector v)
{
    return sg_Geometry_InvertVector(&v);
}

vector limit_vector(const vector *v, float limit)
{
    return sg_Geometry_LimitVector(v, limit);
}

vector limit_vector_byval(const vector v, float limit)
{
    return sg_Geometry_LimitVector(&v, limit);
}

vector line_as_vector(const line_segment *line)
{
    return sg_Geometry_LineAsVector(line);
}

vector line_as_vector_byval(const line_segment line)
{
    return sg_Geometry_LineAsVector(&line);
}

bool line_circle_hit(const circle *c, const vector *velocity, const lines_array lines, line_segment *found, int32_t lines_len)
{
    return sg_Geometry_LineCircleHit(c, velocity, lines, found, lines_len) != 0;
}

bool line_circle_hit_byval(const circle c, const vector velocity, const lines_array lines, line_segment *found, int32_t lines_len)
{
    return sg_Geometry_LineCircleHit(&c, &velocity, lines, found, lines_len) != 0;
}

line_segment line_from(float x1, float y1, float x2, float y2)
{
    return sg_Geometry_LineFrom(x1, y1, x2, y2);
}

line_segment line_from_point_to_point(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_LineFromPointToPoint(pt1, pt2);
}

line_segment line_from_point_to_point_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_LineFromPointToPoint(&pt1, &pt2);
}

line_segment line_from_vector(const vector *mv)
{
    return sg_Geometry_LineFromVector(mv);
}

line_segment line_from_vector_byval(const vector mv)
{
    return sg_Geometry_LineFromVector(&mv);
}

line_segment line_from_vector_with_start_point(const point2d *pt, const vector *mv)
{
    return sg_Geometry_LineFromVectorWithStartPoint(pt, mv);
}

line_segment line_from_vector_with_start_point_byval(const point2d pt, const vector mv)
{
    return sg_Geometry_LineFromVectorWithStartPoint(&pt, &mv);
}

line_segment line_from_vector_with_start_xy(float x, float y, const vector *mv)
{
    return sg_Geometry_LineFromVectorWithStartXY(x, y, mv);
}

line_segment line_from_vector_with_start_xy_byval(float x, float y, const vector mv)
{
    return sg_Geometry_LineFromVectorWithStartXY(x, y, &mv);
}

bool line_intersection_point(const line_segment *line1, const line_segment *line2, point2d *pt)
{
    return sg_Geometry_LineIntersectionPoint(line1, line2, pt) != 0;
}

bool line_intersection_point_byval(const line_segment line1, const line_segment line2, point2d *pt)
{
    return sg_Geometry_LineIntersectionPoint(&line1, &line2, pt) != 0;
}

bool line_intersects_circle(const line_segment *l, const circle *c)
{
    return sg_Geometry_LineIntersectsCircle(l, c) != 0;
}

bool line_intersects_circle_byval(const line_segment l, const circle c)
{
    return sg_Geometry_LineIntersectsCircle(&l, &c) != 0;
}

bool line_intersects_lines(const line_segment *line, const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_LineIntersectsLines(line, lines, lines_len) != 0;
}

bool line_intersects_lines_byval(const line_segment line, const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_LineIntersectsLines(&line, lines, lines_len) != 0;
}

bool line_intersects_rect(const line_segment *line, const rectangle *rect)
{
    return sg_Geometry_LineIntersectsRect(line, rect) != 0;
}

bool line_intersects_rect_byval(const line_segment line, const rectangle rect)
{
    return sg_Geometry_LineIntersectsRect(&line, &rect) != 0;
}

float line_magnitude_sq_from_line(const line_segment *line)
{
    return sg_Geometry_LineMagnitudeSqFromLine(line);
}

float line_magnitude_sq_from_line_byval(const line_segment line)
{
    return sg_Geometry_LineMagnitudeSqFromLine(&line);
}

float line_magnitude_sq(float x1, float y1, float x2, float y2)
{
    return sg_Geometry_LineMagnitudeSq(x1, y1, x2, y2);
}

point2d line_mid_point(const line_segment *line)
{
    return sg_Geometry_LineMidPoint(line);
}

point2d line_mid_point_byval(const line_segment line)
{
    return sg_Geometry_LineMidPoint(&line);
}

vector line_normal(const line_segment *line)
{
    return sg_Geometry_LineNormal(line);
}

vector line_normal_byval(const line_segment line)
{
    return sg_Geometry_LineNormal(&line);
}

bool line_segments_intersect(const line_segment *line1, const line_segment *line2)
{
    return sg_Geometry_LineSegmentsIntersect(line1, line2) != 0;
}

bool line_segments_intersect_byval(const line_segment line1, const line_segment line2)
{
    return sg_Geometry_LineSegmentsIntersect(&line1, &line2) != 0;
}

void line_to_string(const line_segment *ln, char *result)
{
    sg_Geometry_LineToString(ln, result);
}

void line_to_string_byval(const line_segment ln, char *result)
{
    sg_Geometry_LineToString(&ln, result);
}

void lines_from_rect(const rectangle *rect, lines_array result, int32_t result_len)
{
    sg_Geometry_LinesFromRect(rect, result, result_len);
}

void lines_from_rect_byval(const rectangle rect, lines_array result, int32_t result_len)
{
    sg_Geometry_LinesFromRect(&rect, result, result_len);
}

void lines_from_triangle(const triangle tri, lines_array result, int32_t result_len)
{
    sg_Geometry_LinesFromTriangle(tri, result, result_len);
}

void lines_from_triangle_byval(const triangle tri, lines_array result, int32_t result_len)
{
    sg_Geometry_LinesFromTriangle(tri, result, result_len);
}

bool lines_rect_intersect(const lines_array lines, const rectangle *r, int32_t lines_len)
{
    return sg_Geometry_LinesRectIntersect(lines, r, lines_len) != 0;
}

bool lines_rect_intersect_byval(const lines_array lines, const rectangle r, int32_t lines_len)
{
    return sg_Geometry_LinesRectIntersect(lines, &r, lines_len) != 0;
}

vector matrix_multiply_vector(matrix2d m, const vector *v)
{
    return sg_Geometry_MatrixMultiplyVector(m, v);
}

vector matrix_multiply_vector_byval(matrix2d m, const vector v)
{
    return sg_Geometry_MatrixMultiplyVector(m, &v);
}

void matrix_multiply(matrix2d m1, matrix2d m2, matrix2d result)
{
    sg_Geometry_MatrixMultiply(m1, m2, result);
}

void matrix_multiply_byval(matrix2d m1, matrix2d m2, matrix2d result)
{
    sg_Geometry_MatrixMultiply(m1, m2, result);
}

void matrix_to_string(matrix2d m, char *result)
{
    sg_Geometry_MatrixToString(m, result);
}

void matrix_to_string_byval(matrix2d m, char *result)
{
    sg_Geometry_MatrixToString(m, result);
}

point2d point_add(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_PointAdd(pt1, pt2);
}

point2d point_add_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_PointAdd(&pt1, &pt2);
}

point2d point_at(float x, float y)
{
    return sg_Geometry_PointAt(x, y);
}

point2d point_at_start_with_offset(const point2d *startPoint, const vector *offset)
{
    return sg_Geometry_PointAtStartWithOffset(startPoint, offset);
}

point2d point_at_start_with_offset_byval(const point2d startPoint, const vector offset)
{
    return sg_Geometry_PointAtStartWithOffset(&startPoint, &offset);
}

bool point_in_circle(const point2d *pt, const circle *c)
{
    return sg_Geometry_PointInCircle(pt, c) != 0;
}

bool point_in_circle_byval(const point2d pt, const circle c)
{
    return sg_Geometry_PointInCircle(&pt, &c) != 0;
}

bool point_in_rect(const point2d *pt, const rectangle *rect)
{
    return sg_Geometry_PointInRect(pt, rect) != 0;
}

bool point_in_rect_byval(const point2d pt, const rectangle rect)
{
    return sg_Geometry_PointInRect(&pt, &rect) != 0;
}

bool point_xyin_rect(float x, float y, const rectangle *rect)
{
    return sg_Geometry_PointXYInRect(x, y, rect) != 0;
}

bool point_xyin_rect_byval(float x, float y, const rectangle rect)
{
    return sg_Geometry_PointXYInRect(x, y, &rect) != 0;
}

bool point_in_rect_xy(const point2d *pt, float x, float y, float w, float h)
{
    return sg_Geometry_PointInRectXY(pt, x, y, w, h) != 0;
}

bool point_in_rect_xy_byval(const point2d pt, float x, float y, float w, float h)
{
    return sg_Geometry_PointInRectXY(&pt, x, y, w, h) != 0;
}

bool point_xyin_rect_xy(float ptX, float ptY, float x, float y, float w, float h)
{
    return sg_Geometry_PointXYInRectXY(ptX, ptY, x, y, w, h) != 0;
}

bool point_in_triangle(const point2d *pt, const triangle tri)
{
    return sg_Geometry_PointInTriangle(pt, tri) != 0;
}

bool point_in_triangle_byval(const point2d pt, const triangle tri)
{
    return sg_Geometry_PointInTriangle(&pt, tri) != 0;
}

float point_xyline_distance(float x, float y, const line_segment *line)
{
    return sg_Geometry_PointXYLineDistance(x, y, line);
}

float point_xyline_distance_byval(float x, float y, const line_segment line)
{
    return sg_Geometry_PointXYLineDistance(x, y, &line);
}

float point_line_distance(const point2d *pt, const line_segment *line)
{
    return sg_Geometry_PointLineDistance(pt, line);
}

float point_line_distance_byval(const point2d pt, const line_segment line)
{
    return sg_Geometry_PointLineDistance(&pt, &line);
}

bool point_on_line(const point2d *pt, const line_segment *line)
{
    return sg_Geometry_PointOnLine(pt, line) != 0;
}

bool point_on_line_byval(const point2d pt, const line_segment line)
{
    return sg_Geometry_PointOnLine(&pt, &line) != 0;
}

bool point_on_point(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_PointOnPoint(pt1, pt2) != 0;
}

bool point_on_point_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_PointOnPoint(&pt1, &pt2) != 0;
}

float point_point_distance(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_PointPointDistance(pt1, pt2);
}

float point_point_distance_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_PointPointDistance(&pt1, &pt2);
}

void point_to_string(const point2d *pt, char *result)
{
    sg_Geometry_PointToString(pt, result);
}

void point_to_string_byval(const point2d pt, char *result)
{
    sg_Geometry_PointToString(&pt, result);
}

void points_from_rect(const rectangle *rect, point2d *result, int32_t result_len)
{
    sg_Geometry_PointsFromRect(rect, result, result_len);
}

void points_from_rect_byval(const rectangle rect, point2d *result, int32_t result_len)
{
    sg_Geometry_PointsFromRect(&rect, result, result_len);
}

void points_from_line(const line_segment *line, point2d *result, int32_t result_len)
{
    sg_Geometry_PointsFromLine(line, result, result_len);
}

void points_from_line_byval(const line_segment line, point2d *result, int32_t result_len)
{
    sg_Geometry_PointsFromLine(&line, result, result_len);
}

float ray_circle_intersect_distance(const point2d *ray_origin, const vector *ray_heading, const circle *c)
{
    return sg_Geometry_RayCircleIntersectDistance(ray_origin, ray_heading, c);
}

float ray_circle_intersect_distance_byval(const point2d ray_origin, const vector ray_heading, const circle c)
{
    return sg_Geometry_RayCircleIntersectDistance(&ray_origin, &ray_heading, &c);
}

bool ray_intersection_point(const point2d *fromPt, const vector *heading, const line_segment *line, point2d *pt)
{
    return sg_Geometry_RayIntersectionPoint(fromPt, heading, line, pt) != 0;
}

bool ray_intersection_point_byval(const point2d fromPt, const vector heading, const line_segment line, point2d *pt)
{
    return sg_Geometry_RayIntersectionPoint(&fromPt, &heading, &line, pt) != 0;
}

rectangle rectangle_after_move(const rectangle *rect, const vector *mv)
{
    return sg_Geometry_RectangleAfterMove(rect, mv);
}

rectangle rectangle_after_move_byval(const rectangle rect, const vector mv)
{
    return sg_Geometry_RectangleAfterMove(&rect, &mv);
}

float rectangle_bottom(const rectangle *rect)
{
    return sg_Geometry_RectangleBottom(rect);
}

float rectangle_bottom_byval(const rectangle rect)
{
    return sg_Geometry_RectangleBottom(&rect);
}

point2d rectangle_bottom_left(const rectangle *rect)
{
    return sg_Geometry_RectangleBottomLeft(rect);
}

point2d rectangle_bottom_left_byval(const rectangle rect)
{
    return sg_Geometry_RectangleBottomLeft(&rect);
}

point2d rectangle_bottom_right(const rectangle *rect)
{
    return sg_Geometry_RectangleBottomRight(rect);
}

point2d rectangle_bottom_right_byval(const rectangle rect)
{
    return sg_Geometry_RectangleBottomRight(&rect);
}

point2d rectangle_center(const rectangle *rect)
{
    return sg_Geometry_RectangleCenter(rect);
}

point2d rectangle_center_byval(const rectangle rect)
{
    return sg_Geometry_RectangleCenter(&rect);
}

point2d rectangle_center_bottom(const rectangle *rect)
{
    return sg_Geometry_RectangleCenterBottom(rect);
}

point2d rectangle_center_bottom_byval(const rectangle rect)
{
    return sg_Geometry_RectangleCenterBottom(&rect);
}

point2d rectangle_center_left(const rectangle *rect)
{
    return sg_Geometry_RectangleCenterLeft(rect);
}

point2d rectangle_center_left_byval(const rectangle rect)
{
    return sg_Geometry_RectangleCenterLeft(&rect);
}

point2d rectangle_center_right(const rectangle *rect)
{
    return sg_Geometry_RectangleCenterRight(rect);
}

point2d rectangle_center_right_byval(const rectangle rect)
{
    return sg_Geometry_RectangleCenterRight(&rect);
}

point2d rectangle_center_top(const rectangle *rect)
{
    return sg_Geometry_RectangleCenterTop(rect);
}

point2d rectangle_center_top_byval(const rectangle rect)
{
    return sg_Geometry_RectangleCenterTop(&rect);
}

rectangle rectangle_from(float x, float y, int32_t w, int32_t h)
{
    return sg_Geometry_RectangleFrom(x, y, w, h);
}

rectangle rectangle_from_lines(const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_RectangleFromLines(lines, lines_len);
}

rectangle rectangle_from_lines_byval(const lines_array lines, int32_t lines_len)
{
    return sg_Geometry_RectangleFromLines(lines, lines_len);
}

rectangle rectangle_from_line(const line_segment *line)
{
    return sg_Geometry_RectangleFromLine(line);
}

rectangle rectangle_from_line_byval(const line_segment line)
{
    return sg_Geometry_RectangleFromLine(&line);
}

rectangle rectangle_from_triangle(const triangle tri)
{
    return sg_Geometry_RectangleFromTriangle(tri);
}

rectangle rectangle_from_triangle_byval(const triangle tri)
{
    return sg_Geometry_RectangleFromTriangle(tri);
}

rectangle rectangle_from_circle(const circle *c)
{
    return sg_Geometry_RectangleFromCircle(c);
}

rectangle rectangle_from_circle_byval(const circle c)
{
    return sg_Geometry_RectangleFromCircle(&c);
}

rectangle rectangle_for_points(const point2d *pt1, const point2d *pt2)
{
    return sg_Geometry_RectangleForPoints(pt1, pt2);
}

rectangle rectangle_for_points_byval(const point2d pt1, const point2d pt2)
{
    return sg_Geometry_RectangleForPoints(&pt1, &pt2);
}

rectangle rectangle_at_point(const point2d *pt, int32_t width, int32_t height)
{
    return sg_Geometry_RectangleAtPoint(pt, width, height);
}

rectangle rectangle_at_point_byval(const point2d pt, int32_t width, int32_t height)
{
    return sg_Geometry_RectangleAtPoint(&pt, width, height);
}

float rectangle_left(const rectangle *rect)
{
    return sg_Geometry_RectangleLeft(rect);
}

float rectangle_left_byval(const rectangle rect)
{
    return sg_Geometry_RectangleLeft(&rect);
}

rectangle rectangle_offset(const rectangle *rect, const vector *vec)
{
    return sg_Geometry_RectangleOffset(rect, vec);
}

rectangle rectangle_offset_byval(const rectangle rect, const vector vec)
{
    return sg_Geometry_RectangleOffset(&rect, &vec);
}

float rectangle_right(const rectangle *rect)
{
    return sg_Geometry_RectangleRight(rect);
}

float rectangle_right_byval(const rectangle rect)
{
    return sg_Geometry_RectangleRight(&rect);
}

void rectangle_to_string(const rectangle *rect, char *result)
{
    sg_Geometry_RectangleToString(rect, result);
}

void rectangle_to_string_byval(const rectangle rect, char *result)
{
    sg_Geometry_RectangleToString(&rect, result);
}

float rectangle_top(const rectangle *rect)
{
    return sg_Geometry_RectangleTop(rect);
}

float rectangle_top_byval(const rectangle rect)
{
    return sg_Geometry_RectangleTop(&rect);
}

point2d rectangle_top_left(const rectangle *rect)
{
    return sg_Geometry_RectangleTopLeft(rect);
}

point2d rectangle_top_left_byval(const rectangle rect)
{
    return sg_Geometry_RectangleTopLeft(&rect);
}

point2d rectangle_top_right(const rectangle *rect)
{
    return sg_Geometry_RectangleTopRight(rect);
}

point2d rectangle_top_right_byval(const rectangle rect)
{
    return sg_Geometry_RectangleTopRight(&rect);
}

bool rectangles_intersect(const rectangle *rect1, const rectangle *rect2)
{
    return sg_Geometry_RectanglesIntersect(rect1, rect2) != 0;
}

bool rectangles_intersect_byval(const rectangle rect1, const rectangle rect2)
{
    return sg_Geometry_RectanglesIntersect(&rect1, &rect2) != 0;
}

void rotation_matrix(float deg, matrix2d result)
{
    sg_Geometry_RotationMatrix(deg, result);
}

void scale_matrix(float scale, matrix2d result)
{
    sg_Geometry_ScaleMatrix(scale, result);
}

void scale_matrix_by_point(const point2d *scale, matrix2d result)
{
    sg_Geometry_ScaleMatrixByPoint(scale, result);
}

void scale_matrix_by_point_byval(const point2d scale, matrix2d result)
{
    sg_Geometry_ScaleMatrixByPoint(&scale, result);
}

void scale_rotate_translate_matrix(const point2d *scale, float deg, const point2d *translate, matrix2d result)
{
    sg_Geometry_ScaleRotateTranslateMatrix(scale, deg, translate, result);
}

void scale_rotate_translate_matrix_byval(const point2d scale, float deg, const point2d translate, matrix2d result)
{
    sg_Geometry_ScaleRotateTranslateMatrix(&scale, deg, &translate, result);
}

float sine(float angle)
{
    return sg_Geometry_Sine(angle);
}

vector subtract_vectors(const vector *v1, const vector *v2)
{
    return sg_Geometry_SubtractVectors(v1, v2);
}

vector subtract_vectors_byval(const vector v1, const vector v2)
{
    return sg_Geometry_SubtractVectors(&v1, &v2);
}

float tangent(float angle)
{
    return sg_Geometry_Tangent(angle);
}

bool tangent_points(const point2d *fromPt, const circle *c, point2d *p1, point2d *p2)
{
    return sg_Geometry_TangentPoints(fromPt, c, p1, p2) != 0;
}

bool tangent_points_byval(const point2d fromPt, const circle c, point2d *p1, point2d *p2)
{
    return sg_Geometry_TangentPoints(&fromPt, &c, p1, p2) != 0;
}

void translation_matrix(float dx, float dy, matrix2d result)
{
    sg_Geometry_TranslationMatrix(dx, dy, result);
}

void translation_matrix_pt(const point2d *pt, matrix2d result)
{
    sg_Geometry_TranslationMatrixPt(pt, result);
}

void translation_matrix_pt_byval(const point2d pt, matrix2d result)
{
    sg_Geometry_TranslationMatrixPt(&pt, result);
}

point2d triangle_barycenter(const triangle tri)
{
    return sg_Geometry_TriangleBarycenter(tri);
}

point2d triangle_barycenter_byval(const triangle tri)
{
    return sg_Geometry_TriangleBarycenter(tri);
}

void triangle_from(float ax, float ay, float bx, float by, float cx, float cy, triangle result)
{
    sg_Geometry_TriangleFrom(ax, ay, bx, by, cx, cy, result);
}

void triangle_from_points(const point2d *a, const point2d *b, const point2d *c, triangle result)
{
    sg_Geometry_TriangleFromPoints(a, b, c, result);
}

void triangle_from_points_byval(const point2d a, const point2d b, const point2d c, triangle result)
{
    sg_Geometry_TriangleFromPoints(&a, &b, &c, result);
}

bool triangle_rectangle_intersect(const triangle tri, const rectangle *rect)
{
    return sg_Geometry_TriangleRectangleIntersect(tri, rect) != 0;
}

bool triangle_rectangle_intersect_byval(const triangle tri, const rectangle rect)
{
    return sg_Geometry_TriangleRectangleIntersect(tri, &rect) != 0;
}

void triangle_to_string(const triangle tri, char *result)
{
    sg_Geometry_TriangleToString(tri, result);
}

void triangle_to_string_byval(const triangle tri, char *result)
{
    sg_Geometry_TriangleToString(tri, result);
}

bool triangles_rectangle_intersect(const triangle_array tri, const rectangle *rect, int32_t tri_len)
{
    return sg_Geometry_TrianglesRectangleIntersect(tri, rect, tri_len) != 0;
}

bool triangles_rectangle_intersect_byval(const triangle_array tri, const rectangle rect, int32_t tri_len)
{
    return sg_Geometry_TrianglesRectangleIntersect(tri, &rect, tri_len) != 0;
}

vector unit_vector(const vector *v)
{
    return sg_Geometry_UnitVector(v);
}

vector unit_vector_byval(const vector v)
{
    return sg_Geometry_UnitVector(&v);
}

float vector_angle(const vector *v)
{
    return sg_Geometry_VectorAngle(v);
}

float vector_angle_byval(const vector v)
{
    return sg_Geometry_VectorAngle(&v);
}

vector vector_from_angle(float angle, float magnitude)
{
    return sg_Geometry_VectorFromAngle(angle, magnitude);
}

vector vector_from_point_pt_to_rectangle(const point2d *pt, const rectangle *rect)
{
    return sg_Geometry_VectorFromPointPtToRectangle(pt, rect);
}

vector vector_from_point_pt_to_rectangle_byval(const point2d pt, const rectangle rect)
{
    return sg_Geometry_VectorFromPointPtToRectangle(&pt, &rect);
}

vector vector_from_point_to_rectangle(float x, float y, const rectangle *rect)
{
    return sg_Geometry_VectorFromPointToRectangle(x, y, rect);
}

vector vector_from_point_to_rectangle_byval(float x, float y, const rectangle rect)
{
    return sg_Geometry_VectorFromPointToRectangle(x, y, &rect);
}

vector vector_from_point_to_rect(float x, float y, float rectX, float rectY, int32_t rectWidth, int32_t rectHeight)
{
    return sg_Geometry_VectorFromPointToRect(x, y, rectX, rectY, rectWidth, rectHeight);
}

vector vector_from_points(const point2d *p1, const point2d *p2)
{
    return sg_Geometry_VectorFromPoints(p1, p2);
}

vector vector_from_points_byval(const point2d p1, const point2d p2)
{
    return sg_Geometry_VectorFromPoints(&p1, &p2);
}

bool vector_in_rect(const vector *v, const rectangle *rect)
{
    return sg_Geometry_VectorInRect(v, rect) != 0;
}

bool vector_in_rect_byval(const vector v, const rectangle rect)
{
    return sg_Geometry_VectorInRect(&v, &rect) != 0;
}

bool vector_in_rect_xy(const vector *v, float x, float y, float w, float h)
{
    return sg_Geometry_VectorInRectXY(v, x, y, w, h) != 0;
}

bool vector_in_rect_xy_byval(const vector v, float x, float y, float w, float h)
{
    return sg_Geometry_VectorInRectXY(&v, x, y, w, h) != 0;
}

bool vector_is_zero(const vector *v)
{
    return sg_Geometry_VectorIsZero(v) != 0;
}

bool vector_is_zero_byval(const vector v)
{
    return sg_Geometry_VectorIsZero(&v) != 0;
}

float vector_magnitude(const vector *v)
{
    return sg_Geometry_VectorMagnitude(v);
}

float vector_magnitude_byval(const vector v)
{
    return sg_Geometry_VectorMagnitude(&v);
}

float vector_magnitude_sq(const vector *v)
{
    return sg_Geometry_VectorMagnitudeSq(v);
}

float vector_magnitude_sq_byval(const vector v)
{
    return sg_Geometry_VectorMagnitudeSq(&v);
}

vector vector_multiply(const vector *v, float s)
{
    return sg_Geometry_VectorMultiply(v, s);
}

vector vector_multiply_byval(const vector v, float s)
{
    return sg_Geometry_VectorMultiply(&v, s);
}

vector vector_normal(const vector *v)
{
    return sg_Geometry_VectorNormal(v);
}

vector vector_normal_byval(const vector v)
{
    return sg_Geometry_VectorNormal(&v);
}

vector vector_out_of_circle_from_circle(const circle *src, const circle *bounds, const vector *velocity)
{
    return sg_Geometry_VectorOutOfCircleFromCircle(src, bounds, velocity);
}

vector vector_out_of_circle_from_circle_byval(const circle src, const circle bounds, const vector velocity)
{
    return sg_Geometry_VectorOutOfCircleFromCircle(&src, &bounds, &velocity);
}

vector vector_out_of_circle_from_point(const point2d *pt, const circle *c, const vector *velocity)
{
    return sg_Geometry_VectorOutOfCircleFromPoint(pt, c, velocity);
}

vector vector_out_of_circle_from_point_byval(const point2d pt, const circle c, const vector velocity)
{
    return sg_Geometry_VectorOutOfCircleFromPoint(&pt, &c, &velocity);
}

vector vector_out_of_rect_from_circle(const circle *c, const rectangle *rect, const vector *velocity)
{
    return sg_Geometry_VectorOutOfRectFromCircle(c, rect, velocity);
}

vector vector_out_of_rect_from_circle_byval(const circle c, const rectangle rect, const vector velocity)
{
    return sg_Geometry_VectorOutOfRectFromCircle(&c, &rect, &velocity);
}

vector vector_out_of_rect_from_point(const point2d *pt, const rectangle *rect, const vector *velocity)
{
    return sg_Geometry_VectorOutOfRectFromPoint(pt, rect, velocity);
}

vector vector_out_of_rect_from_point_byval(const point2d pt, const rectangle rect, const vector velocity)
{
    return sg_Geometry_VectorOutOfRectFromPoint(&pt, &rect, &velocity);
}

vector vector_out_of_rect_from_rect(const rectangle *src, const rectangle *bounds, const vector *velocity)
{
    return sg_Geometry_VectorOutOfRectFromRect(src, bounds, velocity);
}

vector vector_out_of_rect_from_rect_byval(const rectangle src, const rectangle bounds, const vector velocity)
{
    return sg_Geometry_VectorOutOfRectFromRect(&src, &bounds, &velocity);
}

vector vector_over_lines_from_circle(const circle *c, const lines_array lines, const vector *velocity, int32_t *maxIdx, int32_t lines_len)
{
    return sg_Geometry_VectorOverLinesFromCircle(c, lines, velocity, maxIdx, lines_len);
}

vector vector_over_lines_from_circle_byval(const circle c, const lines_array lines, const vector velocity, int32_t *maxIdx, int32_t lines_len)
{
    return sg_Geometry_VectorOverLinesFromCircle(&c, lines, &velocity, maxIdx, lines_len);
}

vector vector_over_lines_from_lines(const lines_array srcLines, const lines_array boundLines, const vector *velocity, int32_t *maxIdx, int32_t srcLines_len, int32_t boundLines_len)
{
    return sg_Geometry_VectorOverLinesFromLines(srcLines, boundLines, velocity, maxIdx, srcLines_len, boundLines_len);
}

vector vector_over_lines_from_lines_byval(const lines_array srcLines, const lines_array boundLines, const vector velocity, int32_t *maxIdx, int32_t srcLines_len, int32_t boundLines_len)
{
    return sg_Geometry_VectorOverLinesFromLines(srcLines, boundLines, &velocity, maxIdx, srcLines_len, boundLines_len);
}

vector vector_to(float x, float y)
{
    return sg_Geometry_VectorTo(x, y, false != 0);
}

vector vector_to_with_invert_y(float x, float y, bool invertY)
{
    return sg_Geometry_VectorTo(x, y, invertY != 0);
}

vector vector_to_point(const point2d *p1)
{
    return sg_Geometry_VectorToPoint(p1);
}

vector vector_to_point_byval(const point2d p1)
{
    return sg_Geometry_VectorToPoint(&p1);
}

bool vectors_equal(const vector *v1, const vector *v2)
{
    return sg_Geometry_VectorsEqual(v1, v2) != 0;
}

bool vectors_equal_byval(const vector v1, const vector v2)
{
    return sg_Geometry_VectorsEqual(&v1, &v2) != 0;
}

bool vectors_not_equal(const vector *v1, const vector *v2)
{
    return sg_Geometry_VectorsNotEqual(v1, v2) != 0;
}

bool vectors_not_equal_byval(const vector v1, const vector v2)
{
    return sg_Geometry_VectorsNotEqual(&v1, &v2) != 0;
}

void widest_points(const circle *c, const vector *along, point2d *pt1, point2d *pt2)
{
    sg_Geometry_WidestPoints(c, along, pt1, pt2);
}

void widest_points_byval(const circle c, const vector along, point2d *pt1, point2d *pt2)
{
    sg_Geometry_WidestPoints(&c, &along, pt1, pt2);
}

