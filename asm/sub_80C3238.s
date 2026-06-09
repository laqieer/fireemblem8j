	.syntax unified
	.set sub_80C02BC, 0x080C02BC + 1
	.section .text.sub_80C3238, "ax", %progbits
@ sub_80C3238 @ JP 0x080C3238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3238
	.thumb_func
sub_80C3238:
	push {lr}
	bl sub_80C02BC
	cmp r0, #0
	beq _080C3244
	movs r0, #1
_080C3244:
	pop {r1}
	bx r1

