	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B31CC, "ax", %progbits
@ sub_80B31CC @ JP 0x080B31CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B31CC
	.thumb_func
sub_80B31CC:
	push {lr}
	ldr r0, _080B31DC @ =0x08A9DD64
	bl Proc_Find
	cmp r0, #0
	bne _080B31E0
	movs r0, #0
	b _080B31E2
	.align 2, 0
_080B31DC: .4byte 0x08A9DD64
_080B31E0:
	movs r0, #1
_080B31E2:
	pop {r1}
	bx r1
	.align 2, 0

