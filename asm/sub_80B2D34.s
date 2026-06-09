	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2D34, "ax", %progbits
@ sub_80B2D34 @ JP 0x080B2D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2D34
	.thumb_func
sub_80B2D34:
	push {lr}
	ldr r0, _080B2D48 @ =0x08A9DD34
	bl Proc_Find
	cmp r0, #0
	beq _080B2D42
	movs r0, #1
_080B2D42:
	pop {r1}
	bx r1
	.align 2, 0
_080B2D48: .4byte 0x08A9DD34

