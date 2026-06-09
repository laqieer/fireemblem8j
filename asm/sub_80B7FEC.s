	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80B7FEC, "ax", %progbits
@ sub_80B7FEC @ JP 0x080B7FEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7FEC
	.thumb_func
sub_80B7FEC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r3
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x46
	str r5, [sp]
	movs r0, #5
	movs r1, #0x78
	bl sub_8012E84
	adds r7, r0, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #5
	movs r1, #0x50
	mov r2, r8
	bl sub_8012E84
	mov sl, r0
	adds r1, r7, #0
	subs r1, #8
	ldr r4, _080B8080 @ =0x000001FF
	ands r1, r4
	lsls r6, r6, #9
	orrs r1, r6
	mov r2, sl
	subs r2, #8
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	orrs r2, r0
	ldr r0, _080B8084 @ =0x08AAFF54
	mov sb, r0
	movs r5, #0xf0
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	movs r1, #0xe8
	subs r1, r1, r7
	ands r1, r4
	orrs r1, r6
	movs r2, #0x98
	mov r0, sl
	subs r2, r2, r0
	ands r2, r4
	mov r0, r8
	orrs r2, r0
	str r5, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8080: .4byte 0x000001FF
_080B8084: .4byte 0x08AAFF54

