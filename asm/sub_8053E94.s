	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8053E94, "ax", %progbits
@ sub_8053E94 @ JP 0x08053E94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053E94
	.thumb_func
sub_8053E94:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08053EF4 @ =0x085E3974
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	str r6, [r0, #0x60]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0xa]
	strh r0, [r6, #0xa]
	bl AnimSort
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, _08053EF8 @ =0x03003020
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053EF4: .4byte 0x085E3974
_08053EF8: .4byte 0x03003020

