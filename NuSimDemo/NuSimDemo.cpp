
// NuSimDemo.cpp : Defines the class behaviors for the application.
//

#include "pch.h"
#include "framework.h"
#include "NuSimDemo.h"

//#include "NuSimAPI.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//#pragma comment(lib, "NuSIM.lib")

// CNuSimDemoApp

BEGIN_MESSAGE_MAP(CNuSimDemoApp, CWinApp)
	ON_COMMAND(ID_HELP, &CWinApp::OnHelp)
END_MESSAGE_MAP()


// CNuSimDemoApp construction

CNuSimDemoApp::CNuSimDemoApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CNuSimDemoApp object

CNuSimDemoApp theApp;

typedef int (*APPENTRYPROC)(void);

typedef int (CALLBACK* LPAPPMAIN)(void);


typedef VOID (PASCAL *LPAPPMAINPROC)(
	HWND			hwnd,
	HINSTANCE		hinst,
	LPTSTR			lpCmdLine,
	INT				nCmdShow,
	APPENTRYPROC	lpProc
);

// CNuSimDemoApp initialization

BOOL CNuSimDemoApp::InitInstance()
{
	// InitCommonControlsEx() is required on Windows XP if an application
	// manifest specifies use of ComCtl32.dll version 6 or later to enable
	// visual styles.  Otherwise, any window creation will fail.
	INITCOMMONCONTROLSEX InitCtrls;
	InitCtrls.dwSize = sizeof(InitCtrls);
	// Set this to include all the common control classes you want to use
	// in your application.
	InitCtrls.dwICC = ICC_WIN95_CLASSES;
	InitCommonControlsEx(&InitCtrls);

	CWinApp::InitInstance();


	// Create the shell manager, in case the dialog contains
	// any shell tree view or shell list view controls.
	CShellManager *pShellManager = new CShellManager;

	// Activate "Windows Native" visual manager for enabling themes in MFC controls
	CMFCVisualManager::SetDefaultManager(RUNTIME_CLASS(CMFCVisualManagerWindows));

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	// of your final executable, you should remove from the following
	// the specific initialization routines you do not need
	// Change the registry key under which our settings are stored
	// TODO: You should modify this string to be something appropriate
	// such as the name of your company or organization
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	LPAPPMAINPROC lpAppMainCb = nullptr;
	HMODULE hModule = LoadLibrary(_T("NuSIM.dll"));
	DWORD dwError = GetLastError();
	lpAppMainCb = (LPAPPMAINPROC)GetProcAddress(hModule, "NuSim_AppMain");

	APPENTRYPROC lpfp = nullptr;
	HMODULE hModule2 = LoadLibrary(_T("NuDemo.dll"));
	if (hModule2 != NULL)
	{
		lpfp = (APPENTRYPROC)GetProcAddress(hModule2, "AppMain");
	}

	if (nullptr != lpAppMainCb)
	{
		lpAppMainCb(NULL, NULL, NULL, 0, lpfp);
	}

	// Delete the shell manager created above.
	if (pShellManager != nullptr)
	{
		delete pShellManager;
	}

#if !defined(_AFXDLL) && !defined(_AFX_NO_MFC_CONTROLS_IN_DIALOGS)
	ControlBarCleanUp();
#endif

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}

