	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D80, 0x08003D80 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8007CE4, "ax", %progbits
@ sub_8007CE4 @ JP 0x08007CE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007CE4
	.thumb_func
sub_8007CE4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	adds r0, r6, #0
	bl sub_8003D80
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl sub_80043B8
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl sub_80043B8
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	movs r0, #1
	bl sub_8008E10
	ldr r0, _08007D8C @ =0x085B9248
	ldr r1, [sp, #0x20]
	bl Proc_StartBlocking
	adds r2, r0, #0
	mov r1, sb
	strh r1, [r2, #0x2a]
	ldr r0, _08007D90 @ =0x02022CA8
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r3, _08007D94 @ =0x03003020
	ldrh r1, [r3, #0x1c]
	subs r0, r0, r1
	add r0, r8
	strh r0, [r2, #0x2c]
	cmp r5, #0
	bge _08007D60
	adds r5, #0x1f
_08007D60:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r1, [r3, #0x1e]
	subs r0, r0, r1
	strh r0, [r2, #0x2e]
	str r7, [r2, #0x34]
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08007D7E
	bl sub_80D65BC
_08007D7E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007D8C: .4byte 0x085B9248
_08007D90: .4byte 0x02022CA8
_08007D94: .4byte 0x03003020

