	.syntax unified
	.set GetPreviousSupportScreenUnit, 0x080A48A8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80A64FC, 0x080A64FC + 1
	.section .text.sub_80A66AC, "ax", %progbits
@ sub_80A66AC @ JP 0x080A66AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A66AC
	.thumb_func
sub_80A66AC:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	rsbs r5, r5, #0
	adds r0, r5, #0
	bl sub_80A64FC
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A6710
	adds r0, r7, #0
	bl sub_8002DE4
	ldr r0, [r7, #0x2c]
	bl GetPreviousSupportScreenUnit
	str r0, [r7, #0x2c]
_080A6710:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

