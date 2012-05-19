extern (C):

struct TestStruct { //12 bytes -> 16 bytes after alignment?
  void* data; //8 bytes
  uint flags; //4 bytes
}

TestStruct test(void* p1, uint p2);