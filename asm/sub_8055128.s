	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8055128, "ax", %progbits
@ sub_8055128 @ JP 0x08055128 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055128
	.thumb_func
sub_8055128:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, _0805515C @ =0x085E3B74
	movs r1, #4
	bl sub_8002BCC
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne _08055156
	adds r0, r1, #0
	bl sub_8002DE4
_08055156:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805515C: .4byte 0x085E3B74

