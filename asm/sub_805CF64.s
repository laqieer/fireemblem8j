	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805CF64, "ax", %progbits
@ sub_805CF64 @ JP 0x0805CF64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CF64
	.thumb_func
sub_805CF64:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0805CFA0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CFA4 @ =0x085FF308
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xcd
	movs r3, #1
	bl sub_8074E80
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CFA0: .4byte 0x0201774C
_0805CFA4: .4byte 0x085FF308

