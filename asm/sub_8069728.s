	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8069728, "ax", %progbits
@ sub_8069728 @ JP 0x08069728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069728
	.thumb_func
sub_8069728:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, _080697B8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080697BC @ =0x08602458
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	mov r0, r8
	bl GetAnimAnotherSide
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	mov r0, sb
	strh r0, [r6, #0x2e]
	ldr r3, _080697C0 @ =0x087FA0B4
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r6, #0x60]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r0, #2]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	strh r5, [r0, #4]
	ldr r1, [r6, #0x60]
	strh r4, [r1, #2]
	ldr r1, [r6, #0x60]
	strh r5, [r1, #4]
	ldrh r2, [r0, #8]
	ldr r1, _080697C4 @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _080697C8 @ =0x087F9CA4
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _080697CC @ =0x087F98E8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080697B8: .4byte 0x0201774C
_080697BC: .4byte 0x08602458
_080697C0: .4byte 0x087FA0B4
_080697C4: .4byte 0x0000F3FF
_080697C8: .4byte 0x087F9CA4
_080697CC: .4byte 0x087F98E8

