#ifndef __TEST_H__
#define __TEST_H__

#ifdef __cplusplus
extern "C" {
#endif
	typedef struct {
	  void* data;
	  unsigned flags;
	} TestStruct;

	TestStruct test(void* p1, unsigned p2);

#ifdef __cplusplus
}
#endif

#endif