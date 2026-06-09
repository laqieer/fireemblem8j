	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2D1C, "ax", %progbits
@ sub_80B2D1C @ JP 0x080B2D1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2D1C
	.thumb_func
sub_80B2D1C:
	push {lr}
	ldr r0, _080B2D30 @ =0x08A9DD0C
	bl Proc_Find
	cmp r0, #0
	beq _080B2D2A
	movs r0, #1
_080B2D2A:
	pop {r1}
	bx r1
	.align 2, 0
_080B2D30: .4byte 0x08A9DD0C

