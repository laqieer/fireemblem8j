	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.IsMusicProc2Running, "ax", %progbits
@ IsMusicProc2Running @ JP 0x080028A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsMusicProc2Running
	.thumb_func
IsMusicProc2Running:
	push {lr}
	ldr r0, _080028B0 @ =0x08577620
	bl Proc_Find
	cmp r0, #0
	bne _080028B4
	movs r0, #0
	b _080028B6
	.align 2, 0
_080028B0: .4byte 0x08577620
_080028B4:
	movs r0, #1
_080028B6:
	pop {r1}
	bx r1
	.align 2, 0

