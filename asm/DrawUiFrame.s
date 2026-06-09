	.syntax unified
	.section .text.DrawUiFrame, "ax", %progbits
@ DrawUiFrame @ JP 0x0804EF40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawUiFrame
	.thumb_func
DrawUiFrame:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	ldr r0, [sp, #0x34]
	ldr r1, _0804F094 @ =0x085E0610
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	add r3, sl
	subs r3, #1
	mov ip, r3
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	adds r0, #1
	cmp r0, r2
	bge _0804EFEC
_0804EF74:
	mov r3, sl
	adds r3, #1
	lsls r7, r0, #5
	adds r0, #2
	str r0, [sp, #8]
	cmp r3, ip
	bge _0804EFB8
	adds r0, r3, r7
	lsls r5, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xa
	mov sb, r1
_0804EF8C:
	lsrs r1, r5, #0x10
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4, #0xc]
	adds r0, r0, r6
	strh r0, [r1]
	ldrh r0, [r4, #0xc]
	adds r0, r0, r6
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x40
	ldrh r0, [r4, #0x12]
	adds r0, r0, r6
	strh r0, [r2]
	adds r1, #0x42
	ldrh r0, [r4, #0x14]
	adds r0, r0, r6
	strh r0, [r1]
	add r5, sb
	adds r3, #2
	cmp r3, ip
	blt _0804EF8C
_0804EFB8:
	mov r0, sl
	adds r2, r7, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r4, #0x10]
	adds r0, r0, r6
	strh r0, [r2]
	mov r0, ip
	adds r1, r7, r0
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4, #0xe]
	adds r0, r0, r6
	strh r0, [r1]
	adds r2, #0x40
	ldrh r0, [r4, #0x10]
	adds r0, r0, r6
	strh r0, [r2]
	adds r1, #0x40
	ldrh r0, [r4, #0x16]
	adds r0, r0, r6
	strh r0, [r1]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	cmp r0, r1
	blt _0804EF74
_0804EFEC:
	mov r3, sl
	adds r3, #1
	ldr r2, [sp]
	lsls r5, r2, #5
	ldr r7, [sp, #4]
	lsls r7, r7, #5
	mov sb, r7
	cmp r3, ip
	bge _0804F032
	lsls r0, r3, #1
	ldr r2, [sp, #4]
	lsls r1, r2, #6
	add r1, r8
	adds r2, r0, r1
	ldr r7, [sp]
	lsls r1, r7, #6
	add r1, r8
	adds r1, r0, r1
_0804F010:
	ldrh r0, [r4, #4]
	adds r0, r0, r6
	strh r0, [r1]
	ldrh r0, [r4, #4]
	adds r0, r0, r6
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x1a]
	adds r0, r0, r6
	strh r0, [r2]
	ldrh r0, [r4, #0x1c]
	adds r0, r0, r6
	strh r0, [r2, #2]
	adds r2, #4
	adds r1, #4
	adds r3, #2
	cmp r3, ip
	blt _0804F010
_0804F032:
	mov r0, sl
	adds r1, r5, r0
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4]
	adds r0, r0, r6
	strh r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r6
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x40
	ldrh r0, [r4, #8]
	adds r0, r0, r6
	strh r0, [r2]
	adds r1, #0x42
	ldrh r0, [r4, #0xa]
	adds r0, r0, r6
	strh r0, [r1]
	mov r2, ip
	adds r1, r5, r2
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4, #6]
	adds r0, r0, r6
	strh r0, [r1]
	mov r1, sb
	add r1, sl
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4, #0x18]
	adds r0, r0, r6
	strh r0, [r1]
	mov r1, sb
	add r1, ip
	lsls r1, r1, #1
	add r1, r8
	ldrh r0, [r4, #0x1e]
	adds r0, r0, r6
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F094: .4byte 0x085E0610

