	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80B261C, 0x080B261C + 1
	.set sub_80B269C, 0x080B269C + 1
	.section .text.sub_802D218, "ax", %progbits
@ sub_802D218 @ JP 0x0802D218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D218
	.thumb_func
sub_802D218:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl sub_80B261C
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80B269C
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80B269C
	movs r0, #1
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	mov r1, r8
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r7, r0, #0
	bl sub_8003E0C
	movs r4, #0x30
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
	ldr r5, _0802D2EC @ =0x02022CA8
	movs r6, #6
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_8004374
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r7, r0, #0
	bl sub_8003E0C
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r3, r4, #1
	adds r5, #0x30
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_8004374
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D2EC: .4byte 0x02022CA8

