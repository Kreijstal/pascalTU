	.file "kurs.pas"
# Begin asmlist al_procedures

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc1:
# Temps allocated between rbp-8 and rbp+0
# [kurs.pas]
# [6] Begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS@PLT
# [7] for i:=0 to 99 do writeln('Hallo Kurs 337 ')
	movw	$0,U_$P$KURS337_$$_I(%rip)
	subw	$1,U_$P$KURS337_$$_I(%rip)
	.balign 8,0x90
.Lj5:
	addw	$1,U_$P$KURS337_$$_I(%rip)
	call	fpc_get_output@PLT
	movq	%rax,%rbx
	movq	_$KURS337$_Ld1@GOTPCREL(%rip),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr@PLT
	call	FPC_IOCHECK@PLT
	movq	%rbx,%rdi
	call	fpc_writeln_end@PLT
	call	FPC_IOCHECK@PLT
	cmpw	$99,U_$P$KURS337_$$_I(%rip)
	jl	.Lj5
# [9] End.
	call	FPC_DO_EXIT@PLT
	movq	-8(%rbp),%rbx
	leave
	ret
.Lc2:
.Le0:
	.size	main, .Le0 - main

.section .text
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [5] i:integer;
	.type U_$P$KURS337_$$_I,@object
	.size U_$P$KURS337_$$_I,2
U_$P$KURS337_$$_I:
	.zero 2

.section .data.rel.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	5,0
	.quad	INIT$_$SYSTEM
	.quad	0,0
	.quad	FINALIZE$_$OBJPAS
	.quad	INIT$_$UNIX
	.quad	FINALIZE$_$UNIX
	.quad	SYSUTILS$_$TENCODING_$__$$_create
	.quad	SYSUTILS$_$TENCODING_$__$$_destroy
	.quad	INIT$_$SYSUTILS
	.quad	FINALIZE$_$SYSUTILS
# [11] 
.Le1:
	.size	INITFINAL, .Le1 - INITFINAL

.section .data.rel.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le2:
	.size	FPC_THREADVARTABLES, .Le2 - FPC_THREADVARTABLES

.section .data.rel.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	1
	.quad	RESSTR_$SYSCONST_$$_START
	.quad	RESSTR_$SYSCONST_$$_END
.Le3:
	.size	FPC_RESOURCESTRINGTABLES, .Le3 - FPC_RESOURCESTRINGTABLES

.section .data.rel.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le4:
	.size	FPC_WIDEINITTABLES, .Le4 - FPC_WIDEINITTABLES

.section .data.rel.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le5:
	.size	FPC_RESSTRINITTABLES, .Le5 - FPC_RESSTRINITTABLES

.section .fpc.n_version
	.balign 8
	.ascii	"FPC 3.0.4 [2017/11/28] for x86_64 - Linux"

.section .data.rel.n___stklen
	.balign 8
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.quad	8388608

.section .data.rel.n___heapsize
	.balign 8
.globl	__heapsize
	.type	__heapsize,@object
__heapsize:
	.quad	0

.section .data.rel.n___fpc_valgrind
.globl	__fpc_valgrind
	.type	__fpc_valgrind,@object
__fpc_valgrind:
	.byte	0

.section .data.rel.n_FPC_RESLOCATION
	.balign 8
.globl	FPC_RESLOCATION
	.type	FPC_RESLOCATION,@object
FPC_RESLOCATION:
	.quad	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .data.rel.n__$KURS337$_Ld1
	.balign 8
.globl	_$KURS337$_Ld1
_$KURS337$_Ld1:
	.ascii	"\017Hallo Kurs 337 \000"
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.quad	.Lc6
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc10:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

