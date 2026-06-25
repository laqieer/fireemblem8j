	.syntax unified
	.section .text.libagbsyscall, "ax", %progbits
@ libagbsyscall: GBA BIOS syscall wrappers, JP 0x080D6364..0x080D63E0.
@ Region-same svc bodies (svc numbers are universal); consolidated into one
@ real-source TU like ../fireemblem8u/src/libagbsyscall.s. SoftReset keeps the
@ proven descriptive incbin (its literal pool).
	.thumb
	.align 2, 0

	.global ArcTan2
	.thumb_func
ArcTan2:
	svc #0xa
	bx lr

	.global BgAffineSet
	.thumb_func
BgAffineSet:
	svc #0xe
	bx lr

	.global CpuFastSet
	.thumb_func
CpuFastSet:
	svc #0xc
	bx lr

	.global CpuSet
	.thumb_func
CpuSet:
	svc #0xb
	bx lr

	.global Div
	.thumb_func
Div:
	svc #6
	bx lr

	.global DivArm
	.thumb_func
DivArm:
	svc #7
	bx lr

	.global DivRem
	.thumb_func
DivRem:
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

	.global sub_80D6384
	.thumb_func
sub_80D6384:
	svc #7
	adds r0, r1, #0
	bx lr
	.align 2, 0

	.global HuffUnComp
	.thumb_func
HuffUnComp:
	svc #0x13
	bx lr

	.global LZ77UnCompVram
	.thumb_func
LZ77UnCompVram:
	svc #0x12
	bx lr

	.global LZ77UnCompWram
	.thumb_func
LZ77UnCompWram:
	svc #0x11
	bx lr

	.global MultiBoot
	.thumb_func
MultiBoot:
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

	.global ObjAffineSet
	.thumb_func
ObjAffineSet:
	svc #0xf
	bx lr

	.global RLUnCompVram
	.thumb_func
RLUnCompVram:
	svc #0x15
	bx lr

	.global RLUnCompWram
	.thumb_func
RLUnCompWram:
	svc #0x14
	bx lr

	.global SoftReset
	.thumb_func
SoftReset:
	.incbin "data/residual/SoftReset.bin"

	.global SoundBiasReset
	.thumb_func
SoundBiasReset:
	movs r0, #0
	svc #0x19
	bx lr
	.align 2, 0

	.global SoundBiasSet
	.thumb_func
SoundBiasSet:
	movs r0, #1
	svc #0x19
	bx lr
	.align 2, 0

	.global Sqrt
	.thumb_func
Sqrt:
	svc #8
	bx lr

	.global VBlankIntrWait
	.thumb_func
VBlankIntrWait:
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0
