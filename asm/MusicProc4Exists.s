	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.MusicProc4Exists, "ax", %progbits
@ MusicProc4Exists @ JP 0x080029BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MusicProc4Exists
	.thumb_func
MusicProc4Exists:
	push {lr}
	ldr r0, _080029CC @ =0x08577648
	bl Proc_Find
	cmp r0, #0
	bne _080029D0
	movs r0, #0
	b _080029D2
	.align 2, 0
_080029CC: .4byte 0x08577648
_080029D0:
	movs r0, #1
_080029D2:
	pop {r1}
	bx r1
	.align 2, 0

