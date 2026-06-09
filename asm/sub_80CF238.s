	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CB720, 0x080CB720 + 1
	.set sub_80CB7D8, 0x080CB7D8 + 1
	.section .text.sub_80CF238, "ax", %progbits
@ sub_80CF238 @ JP 0x080CF238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF238
	.thumb_func
sub_80CF238:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xb
	bne _080CF2B2
	ldr r5, _080CF34C @ =0x03003020
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sl, r2
	ands r0, r2
	movs r3, #5
	rsbs r3, r3, #0
	mov sb, r3
	ands r0, r3
	movs r1, #8
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5, #1]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	ldrb r0, [r5, #1]
	movs r3, #1
	orrs r0, r3
	mov r1, sl
	ands r0, r1
	mov r2, sb
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	orrs r0, r6
	strb r0, [r5, #1]
_080CF2B2:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xa
	bhi _080CF372
	adds r3, r0, #0
	adds r3, #0x1e
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_8012E84
	adds r4, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetBlendConfig
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl sub_8012E84
	adds r5, r0, #0
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl sub_8012E84
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r7, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r4, r1, r0
	adds r0, r7, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF350
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80CB7D8
	b _080CF370
	.align 2, 0
_080CF34C: .4byte 0x03003020
_080CF350:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80CB720
_080CF370:
	strh r4, [r7, #0x32]
_080CF372:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

