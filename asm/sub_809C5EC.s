	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809C5EC, "ax", %progbits
@ sub_809C5EC @ JP 0x0809C5EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C5EC
	.thumb_func
sub_809C5EC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	cmp r2, #0
	bgt _0809C608
	b _0809C7B6
_0809C608:
	cmp r3, #0
	bgt _0809C60E
	b _0809C7B6
_0809C60E:
	ldr r4, _0809C7C8 @ =0x085B8CDC
	str r7, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, [sp, #8]
	lsls r0, r0, #3
	mov sb, r0
	ldr r6, [sp, #4]
	add r6, sb
	adds r0, r7, #3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r5, sl
	add r5, r8
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #1
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #0x10]
	cmp r5, r3
	bge _0809C6A6
	ldr r6, _0809C7CC @ =0x085B8D14
	ldr r4, [sp, #4]
	adds r4, #8
_0809C678:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809C678
_0809C6A6:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809C6E2
	ldr r6, _0809C7C8 @ =0x085B8CDC
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	subs r5, r1, r5
_0809C6B6:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809C6B6
_0809C6E2:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _0809C71E
	ldr r5, _0809C7C8 @ =0x085B8CDC
	mov r4, sl
	adds r4, #8
	adds r6, r0, #0
	subs r6, #1
_0809C6F2:
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #9
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	add r1, sb
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0809C6F2
_0809C71E:
	movs r6, #1
	ldr r1, [sp, #0xc]
	cmp r6, r1
	bge _0809C7B6
	ldr r3, [sp, #8]
	subs r3, #3
	mov sb, r3
	adds r7, #5
	mov r8, r7
_0809C730:
	movs r5, #1
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r5, sb
	bge _0809C75A
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_0809C740:
	mov r1, r8
	str r1, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809C7D0 @ =0x085B8D34
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, sb
	blt _0809C740
_0809C75A:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809C784
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_0809C768:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809C7CC @ =0x085B8D14
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809C768
_0809C784:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809C7AE
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	lsls r6, r6, #3
	subs r5, r1, r5
_0809C794:
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _0809C7C8 @ =0x085B8CDC
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809C794
_0809C7AE:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0809C730
_0809C7B6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7C8: .4byte 0x085B8CDC
_0809C7CC: .4byte 0x085B8D14
_0809C7D0: .4byte 0x085B8D34

