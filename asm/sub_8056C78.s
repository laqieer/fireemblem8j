	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8056C78, "ax", %progbits
@ sub_8056C78 @ JP 0x08056C78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056C78
	.thumb_func
sub_8056C78:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	strh r5, [r4, #0x2c]
	movs r0, #0xf
	strh r0, [r4, #0x2e]
	ldr r2, _08056D6C @ =0x0203E11E
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r7, #2
	ldrsh r0, [r2, r7]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	str r5, [sp, #4]
	ldr r1, _08056D70 @ =0x02023CA8
	ldr r2, _08056D74 @ =0x01000200
	add r0, sp, #4
	bl sub_80D636C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	ldr r7, _08056D78 @ =0x03003020
	mov r8, r7
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r2, #0x20
	mov sl, r2
	mov r3, sl
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	mov r0, r8
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	mov r1, r8
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x34
	add r0, r8
	mov sb, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r3, #4
	orrs r1, r3
	movs r2, #8
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	movs r7, #0x36
	add r8, r7
	mov r7, r8
	ldrb r0, [r7]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r3, sl
	orrs r0, r3
	strb r0, [r7]
	adds r0, r4, #0
	bl sub_8002DE4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056D6C: .4byte 0x0203E11E
_08056D70: .4byte 0x02023CA8
_08056D74: .4byte 0x01000200
_08056D78: .4byte 0x03003020

