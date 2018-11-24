#ifndef _PATH_H
#define _PATH_H

struct path_model {
  int* topics;
};

struct path_model* lda_create_path(int length);

#endif /* _PATH_H */

