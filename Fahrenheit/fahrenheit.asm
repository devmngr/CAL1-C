; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.24215.1 

	TITLE	D:\School\Semester 3\VisualStudio Projects\Fahrenheit\Fahrenheit\fahrenheit.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
$SG4508	DB	'%d', 09H, '%d', 0aH, 00H
_DATA	ENDS
PUBLIC	___local_stdio_printf_options
PUBLIC	__vfprintf_l
PUBLIC	_printf
PUBLIC	_main
EXTRN	___acrt_iob_func:PROC
EXTRN	___stdio_common_vfprintf:PROC
_DATA	SEGMENT
COMM	?_OptionsStorage@?1??__local_stdio_printf_options@@9@9:QWORD							; `__local_stdio_printf_options'::`2'::_OptionsStorage
_DATA	ENDS
; Function compile flags: /Odtp
; File d:\school\semester 3\visualstudio projects\fahrenheit\fahrenheit\fahrenheit.c
_TEXT	SEGMENT
_step$ = -20						; size = 4
_celsius$ = -16						; size = 4
_upper$ = -12						; size = 4
_lower$ = -8						; size = 4
_fahr$ = -4						; size = 4
_main	PROC

; 5    : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 6    : 	int fahr, celsius;
; 7    : 	int lower, upper, step;
; 8    : 	lower = 0; /* lower limit of temperature scale */

	mov	DWORD PTR _lower$[ebp], 0

; 9    : 	upper = 300; /* upper limit */

	mov	DWORD PTR _upper$[ebp], 300		; 0000012cH

; 10   : 	step = 20; /* step size */

	mov	DWORD PTR _step$[ebp], 20		; 00000014H

; 11   : 	fahr = lower;

	mov	eax, DWORD PTR _lower$[ebp]
	mov	DWORD PTR _fahr$[ebp], eax
$LN2@main:

; 12   : 	while (fahr <= upper) {

	mov	ecx, DWORD PTR _fahr$[ebp]
	cmp	ecx, DWORD PTR _upper$[ebp]
	jg	SHORT $LN1@main

; 13   : 		celsius = 5 * (fahr - 32) / 9;

	mov	edx, DWORD PTR _fahr$[ebp]
	sub	edx, 32					; 00000020H
	imul	eax, edx, 5
	cdq
	mov	ecx, 9
	idiv	ecx
	mov	DWORD PTR _celsius$[ebp], eax

; 14   : 		printf("%d\t%d\n", fahr, celsius);

	mov	edx, DWORD PTR _celsius$[ebp]
	push	edx
	mov	eax, DWORD PTR _fahr$[ebp]
	push	eax
	push	OFFSET $SG4508
	call	_printf
	add	esp, 12					; 0000000cH

; 15   : 		fahr = fahr + step;

	mov	ecx, DWORD PTR _fahr$[ebp]
	add	ecx, DWORD PTR _step$[ebp]
	mov	DWORD PTR _fahr$[ebp], ecx

; 16   : 	}

	jmp	SHORT $LN2@main
$LN1@main:

; 17   : }

	xor	eax, eax
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\program files (x86)\windows kits\10\include\10.0.10240.0\ucrt\stdio.h
;	COMDAT _printf
_TEXT	SEGMENT
__Result$ = -8						; size = 4
__ArgList$ = -4						; size = 4
__Format$ = 8						; size = 4
_printf	PROC						; COMDAT

; 950  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 951  :     int _Result;
; 952  :     va_list _ArgList;
; 953  :     __crt_va_start(_ArgList, _Format);

	lea	eax, DWORD PTR __Format$[ebp+4]
	mov	DWORD PTR __ArgList$[ebp], eax

; 954  :     _Result = _vfprintf_l(stdout, _Format, NULL, _ArgList);

	mov	ecx, DWORD PTR __ArgList$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR __Format$[ebp]
	push	edx
	push	1
	call	___acrt_iob_func
	add	esp, 4
	push	eax
	call	__vfprintf_l
	add	esp, 16					; 00000010H
	mov	DWORD PTR __Result$[ebp], eax

; 955  :     __crt_va_end(_ArgList);

	mov	DWORD PTR __ArgList$[ebp], 0

; 956  :     return _Result;

	mov	eax, DWORD PTR __Result$[ebp]

; 957  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_printf	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\program files (x86)\windows kits\10\include\10.0.10240.0\ucrt\stdio.h
;	COMDAT __vfprintf_l
_TEXT	SEGMENT
__Stream$ = 8						; size = 4
__Format$ = 12						; size = 4
__Locale$ = 16						; size = 4
__ArgList$ = 20						; size = 4
__vfprintf_l PROC					; COMDAT

; 638  : {

	push	ebp
	mov	ebp, esp

; 639  :     return __stdio_common_vfprintf(_CRT_INTERNAL_LOCAL_PRINTF_OPTIONS, _Stream, _Format, _Locale, _ArgList);

	mov	eax, DWORD PTR __ArgList$[ebp]
	push	eax
	mov	ecx, DWORD PTR __Locale$[ebp]
	push	ecx
	mov	edx, DWORD PTR __Format$[ebp]
	push	edx
	mov	eax, DWORD PTR __Stream$[ebp]
	push	eax
	call	___local_stdio_printf_options
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR [eax]
	push	edx
	call	___stdio_common_vfprintf
	add	esp, 24					; 00000018H

; 640  : }

	pop	ebp
	ret	0
__vfprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\program files (x86)\windows kits\10\include\10.0.10240.0\ucrt\corecrt_stdio_config.h
;	COMDAT ___local_stdio_printf_options
_TEXT	SEGMENT
___local_stdio_printf_options PROC			; COMDAT

; 73   : {

	push	ebp
	mov	ebp, esp

; 74   :     static unsigned __int64 _OptionsStorage;
; 75   :     return &_OptionsStorage;

	mov	eax, OFFSET ?_OptionsStorage@?1??__local_stdio_printf_options@@9@9 ; `__local_stdio_printf_options'::`2'::_OptionsStorage

; 76   : }

	pop	ebp
	ret	0
___local_stdio_printf_options ENDP
_TEXT	ENDS
END
