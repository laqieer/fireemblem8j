	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_8013BAC, "ax", %progbits
@ sub_8013BAC @ JP 0x08013BAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013BAC
	.thumb_func
sub_8013BAC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, _08013C10 @ =0x03003020
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x10
	strh r0, [r1]
	adds r4, #0x66
	strh r2, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013C10: .4byte 0x03003020

