	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8066318, "ax", %progbits
@ sub_8066318 @ JP 0x08066318 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066318
	.thumb_func
sub_8066318:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806634C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066350 @ =0x08601788
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08066354 @ =0x080E33D6
	str r1, [r0, #0x48]
	ldr r1, _08066358 @ =0x087611E4
	str r1, [r0, #0x4c]
	ldr r0, _0806635C @ =0x08760304
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806634C: .4byte 0x0201774C
_08066350: .4byte 0x08601788
_08066354: .4byte 0x080E33D6
_08066358: .4byte 0x087611E4
_0806635C: .4byte 0x08760304

