#include <stdlib.h>
#include <string.h>
#include "path.h"

struct path_model* lda_create_path(int length) {
  struct path_model* model = (struct path_model*)malloc(sizeof(struct path_model));
  model->topics = (int*)malloc(sizeof(int) * length);
  return model;
}
