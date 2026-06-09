	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802F584, 0x0802F584 + 1
	.section .text.sub_8012340, "ax", %progbits
@ sub_8012340 @ JP 0x08012340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012340
	.thumb_func
sub_8012340:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _080123E4 @ =0x03003020
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, r8
	adds r1, r6, #0
	movs r3, #0
	bl sub_802F584
	ldr r1, _080123E8 @ =0x0203A4E8
	ldr r0, _080123EC @ =0x0203A568
	adds r0, #0x4a
	strh r5, [r0]
	adds r1, #0x4a
	strh r5, [r1]
	ldr r1, _080123F0 @ =0x0203A4D0
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl sub_802C94C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080123E4: .4byte 0x03003020
_080123E8: .4byte 0x0203A4E8
_080123EC: .4byte 0x0203A568
_080123F0: .4byte 0x0203A4D0

