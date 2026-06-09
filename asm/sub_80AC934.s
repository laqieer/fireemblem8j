	.syntax unified
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_80AC934, "ax", %progbits
@ sub_80AC934 @ JP 0x080AC934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AC934
	.thumb_func
sub_80AC934:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080ACA1C @ =0x02000500
	ldr r1, _080ACA20 @ =0x02000280
	str r1, [r0]
	ldr r2, _080ACA24 @ =0x02000504
	ldr r3, _080ACA28 @ =0xFFFFFD80
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _080ACA2C @ =0x02000508
	str r1, [r0]
	ldr r7, _080ACA30 @ =0x03003020
	ldrb r0, [r7, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r5, r7, #0
	adds r5, #0x34
	ldrb r0, [r5]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	movs r0, #0x36
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r1, sb
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r4, #0
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r0, #5
	strb r4, [r0]
	adds r1, #3
	movs r0, #0xa0
	strb r0, [r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r5]
	orrs r0, r6
	strb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	mov r3, sb
	ldrb r0, [r3]
	orrs r0, r6
	strb r0, [r3]
	movs r0, #0x4c
	add r8, r0
	mov r1, r8
	strh r4, [r1]
	ldr r0, _080ACA34 @ =Minimap_OnHBlank
	bl SetPrimaryHBlankHandler
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA1C: .4byte 0x02000500
_080ACA20: .4byte 0x02000280
_080ACA24: .4byte 0x02000504
_080ACA28: .4byte 0xFFFFFD80
_080ACA2C: .4byte 0x02000508
_080ACA30: .4byte 0x03003020
_080ACA34: .4byte 0x080AC8DD  @ Minimap_OnHBlank

