	.syntax unified
	.set sub_80088FC, 0x080088FC + 1
	.section .text.sub_80BA8CC, "ax", %progbits
@ sub_80BA8CC @ JP 0x080BA8CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA8CC
	.thumb_func
sub_80BA8CC:
	push {lr}
	bl sub_80088FC
	cmp r0, #1
	bne _080BA8DA
	movs r0, #1
	b _080BA8DC
_080BA8DA:
	movs r0, #0
_080BA8DC:
	pop {r1}
	bx r1

