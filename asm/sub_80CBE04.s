	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80CBE04, "ax", %progbits
@ sub_80CBE04 @ JP 0x080CBE04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBE04
	.thumb_func
sub_80CBE04:
	push {lr}
	ldr r0, _080CBE18 @ =0x08B3F2D0
	bl Proc_Find
	cmp r0, #0
	beq _080CBE12
	movs r0, #1
_080CBE12:
	pop {r1}
	bx r1
	.align 2, 0
_080CBE18: .4byte 0x08B3F2D0

