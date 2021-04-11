#if !defined (__NU_SIMAPI_H__)
#define __NU_SIMAPI_H__

#ifdef  __cplusplus
extern "C" {
#endif

# if defined (_USRDLL)
#   define NUSIMAPI __declspec(dllexport)
# else
#   define NUSIMAPI __declspec(dllimport)
# endif

typedef void (*APPENTRYPROC)(void);

NUSIMAPI VOID PASCAL NuSim_AppMain (HWND, HINSTANCE, LPTSTR, INT, APPENTRYPROC);

#ifdef  __cplusplus
}
#endif

#endif // __NU_SIMAPI_H__
