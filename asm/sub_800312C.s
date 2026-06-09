	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_800312C, "ax", %progbits
@ sub_800312C @ JP 0x0800312C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800312C
	.thumb_func
sub_800312C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl sub_8002BCC
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

