	.syntax unified
	.set sub_8086604, 0x08086604 + 1
	.set sub_8086694, 0x08086694 + 1
	.section .text.sub_801CF64, "ax", %progbits
@ sub_801CF64 @ JP 0x0801CF64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CF64
	.thumb_func
sub_801CF64:
	push {lr}
	bl sub_8086604
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CF74
	movs r0, #1
	b _0801CF7A
_0801CF74:
	bl sub_8086694
	movs r0, #0
_0801CF7A:
	pop {r1}
	bx r1
	.align 2, 0

