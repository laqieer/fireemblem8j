	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CB720, 0x080CB720 + 1
	.set sub_80CB7D8, 0x080CB7D8 + 1
	.set sub_80CC178, 0x080CC178 + 1
	.section .text.sub_80CF0D8, "ax", %progbits
@ sub_80CF0D8 @ JP 0x080CF0D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF0D8
	.thumb_func
sub_80CF0D8:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	ldrh r1, [r6, #0x3a]
	bl sub_80CC178
	ldrh r0, [r6, #0x38]
	strh r0, [r6, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r6, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	ldrh r3, [r6, #0x2a]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_8012E84
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetBlendConfig
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r2, r1, #0
	adds r2, #0x10
	ldrh r3, [r6, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r7, [r0]
	cmp r7, #0
	beq _080CF176
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl sub_80CB720
	b _080CF196
_080CF176:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	str r7, [sp, #8]
	movs r3, #0
	bl sub_80CB7D8
_080CF196:
	adds r7, r4, #0
	strh r5, [r6, #0x30]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r6, #0x2a]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl sub_8012E84
	adds r5, r0, #0
	ldrh r3, [r6, #0x2a]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl sub_8012E84
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r6, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r5, r1, r0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF1FC
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80CB7D8
	b _080CF218
_080CF1FC:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80CB720
_080CF218:
	strh r5, [r6, #0x32]
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1e
	bne _080CF22C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080CF230
_080CF22C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CF230:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

