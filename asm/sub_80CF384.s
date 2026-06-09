	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CB720, 0x080CB720 + 1
	.set sub_80CB7D8, 0x080CB7D8 + 1
	.set sub_80CC178, 0x080CC178 + 1
	.set sub_80CF238, 0x080CF238 + 1
	.section .text.sub_80CF384, "ax", %progbits
@ sub_80CF384 @ JP 0x080CF384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF384
	.thumb_func
sub_80CF384:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80CF238
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80CC178
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	adds r3, r0, #0
	subs r3, #0xf
	cmp r3, #0
	blt _080CF3DE
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	ldr r2, _080CF42C @ =0x03003020
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CF3DE:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r2, [r0]
	adds r1, r2, #0
	adds r1, #0x10
	lsls r2, r2, #1
	adds r2, #0x10
	ldrh r3, [r4, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	bl sub_8012E84
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r5, [r0]
	cmp r5, #0
	beq _080CF430
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl sub_80CB720
	b _080CF450
	.align 2, 0
_080CF42C: .4byte 0x03003020
_080CF430:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0
	bl sub_80CB7D8
_080CF450:
	strh r6, [r4, #0x30]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x1e
	bne _080CF464
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CF468
_080CF464:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CF468:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

