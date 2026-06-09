	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8089D64, "ax", %progbits
@ sub_8089D64 @ JP 0x08089D64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089D64
	.thumb_func
sub_8089D64:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _08089DC0 @ =0x08A728E4
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08089DB4
	ldr r0, _08089DC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089D92
	movs r0, #0x6f
	bl m4aSongNumStart
_08089D92:
	adds r0, r7, #0
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #8
	strh r5, [r0]
	ldr r0, _08089DC8 @ =0x02003BFC
	strh r5, [r0, #2]
	str r4, [r0, #0x14]
	movs r1, #1
	strb r1, [r0, #8]
_08089DB4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089DC0: .4byte 0x08A728E4
_08089DC4: .4byte 0x0202BCEC
_08089DC8: .4byte 0x02003BFC

