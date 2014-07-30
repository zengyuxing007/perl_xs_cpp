#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


#undef init_tm
#undef do_open
#undef do_close

#ifdef ENTER
#undef ENTER
#endif

#include <iostream>

using namespace std;

class MyClass {
    public:
        MyClass(char * my_favorite_argument) {
            cout << "I'm constructin' my bad self ... " << my_favorite_argument << "\n";
        }

        ~MyClass() { cout << "Destruction is a way of life for me.\n"; }

        int wow() { return 12 / 3; }

        void wow_print(){
            cout<<"---WOW---"<<endl;
        }
};

MODULE = MyModule		PACKAGE = MyModule		


MyClass *
MyClass::new(char * my_favorite_argument)

void
MyClass::DESTROY()

int
MyClass::wow()

void
MyClass::wow2()
PPCODE:
    for(int i=1;i<=10;i++) {
        XPUSHs(sv_2mortal(newSVnv(i * THIS->wow())));
    }
